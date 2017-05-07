class User < ActiveRecord::Base
  validates :user_name, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :create_session_token
  attr_reader :password

  def self.find_by_credentials(user_name, password)
    @user = User.find_by(user_name: user_name)
    return nil if @user.nil?
    @user.is_password?(password) ? @user : nil
  end

  def create_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64(128)
    self.save!
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  has_many :cats,
  foreign_key: :user_id,
  class_name: :Cat

  has_many :rental_requests,
    foreign_key: :user_id,
    class_name: :CatRentalRequest


end
