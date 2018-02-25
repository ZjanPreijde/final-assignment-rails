class Batch < ApplicationRecord
  has_many :students, dependent: :destroy
  validates :name, :start_date, :end_date, presence: true
  validates :name, uniqueness: true
  validate :check_end_date

  def check_end_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "can't be before Start date")
    end
  end

end
