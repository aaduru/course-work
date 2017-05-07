class CatRentalRequest < ActiveRecord::Base
  validates :start_date, :end_date, :cat_id, presence: true

  # validates :cat_id, uniqueness: true

  validates :status, inclusion: { in: %w(APPROVED DENIED PENDING) }

  validate :validate_appoved_requests

  validate :start_end_date_validation

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date: self.start_date, end_date: self.end_date)
        (:start_date < end_date and start_date < :end_date) or
        (start_date < :end_date and :start_date < end_date)
      SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def validate_appoved_requests

    unless overlapping_approved_requests.empty?
      errors[:cat] << " is already taken"
    end
  end


  def start_end_date_validation
    if start_date > end_date
      errors[:start_date] << "is larger than end_date"
    end
  end

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

end
