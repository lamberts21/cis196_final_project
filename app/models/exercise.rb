class Exercise < ApplicationRecord
  belongs_to :workout
  validates :name, presence: true
  validates :time, presence: true
end
