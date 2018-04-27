class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorite_workouts
  validates :name, presence: true
end
