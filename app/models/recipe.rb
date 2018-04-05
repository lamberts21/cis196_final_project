class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validates :instructions, presence: true, length: { minimum: 10 }
end
