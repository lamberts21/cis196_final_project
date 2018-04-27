class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  validates :name, presence: true
end
