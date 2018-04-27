class User < ApplicationRecord
  include BCrypt
  has_many :recipes
  has_many :workouts
  has_many :comments, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  has_many :favorite_recipes, dependent: :destroy
  has_many :favorite_workouts, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validate :valid_first_name
  validate :valid_last_name

  def valid_first_name
    errors.add(:first_name, 'must not be empty or nil') if first_name.nil? || first_name.empty?
  end

  def valid_last_name
    errors.add(:last_name, 'must not be empty or nil') if last_name.nil? || last_name.empty?
  end

  def full_name
    first_name + ' ' + last_name
  end

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
