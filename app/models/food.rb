class Food < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy
=======
  has_many :recipe_food, dependent: :destroy
>>>>>>> 323ed92bbef04d22e457f44c8dd81b10b3eabb25
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  def name_with_unit
    "#{name} (#{measurement_unit})"
  end
end
