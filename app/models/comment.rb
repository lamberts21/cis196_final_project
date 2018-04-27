class Comment < ApplicationRecord
  belongs_to :workout
  belongs_to :user
  validates :field, presence: true
end
