class Evaluation < ApplicationRecord
  belongs_to :batch
  belongs_to :student
end