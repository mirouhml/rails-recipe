class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1, only_integer: true }

  def name_with_unit
    "#{name} (#{measurement_unit})"
  end
end
