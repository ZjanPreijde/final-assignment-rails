class Evaluation < ApplicationRecord
  belongs_to :batch
  belongs_to :student
  validates :date, :score, presence: true
  validates :score, inclusion: { in: %w(green yellow red)}

  # validate :check_date
  #
  # def check_date
  #   if date.present?
  #     if date < batch.start_date || date > batch.end_date
  #       errors.add(:date, "is outside Class period")
  #     end
  #   end
  # end

end
