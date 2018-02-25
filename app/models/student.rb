class Student < ApplicationRecord
  belongs_to :batch
  has_many :evaluations, dependent: :destroy
  validates :name, :image_url, presence: true
end
