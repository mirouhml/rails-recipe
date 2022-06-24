class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :user, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :public, inclusion: { in: [true, false] }

  def total_price
    price = 0
    recipe_foods.each { |item| price += item.quantity * item.food.price }
    price
  end
end
