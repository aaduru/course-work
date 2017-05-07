# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string           not null
#  session_token   :string           not null
#

class User < ActiveRecord::Base
  validates :email, :session_token, uniqueness: true
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  attr_reader :password

  # def self.generate_session_token
  #   self.session_token = SecureRandom.urlsafe_base64(128)
  # end

  def self.find_by_credentials(email, password)
    mail = User.find_by(email: email)
    return nil unless mail
    mail.is_password?(password) ? mail : nil
  end

  def reset_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64(128)
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  has_many :notes,
  foreign_key: :user_id,
  class_name: :Note

end
