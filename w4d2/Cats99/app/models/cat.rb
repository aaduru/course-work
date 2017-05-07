class Cat < ActiveRecord::Base
  validates :birth_date, :name, :color,:sex, :description, presence: true
  validates :color, inclusion: { in: %w(white black yellow grey) }
  validates :sex, inclusion: { in: %w(M F) }

    # message: "%{value} is not a valid color"}
  def age(birth_date)
    now = Time.now.utc.to_date
    now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
  end

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    dependent: :destroy

end
