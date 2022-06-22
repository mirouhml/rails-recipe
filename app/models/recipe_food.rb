class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, :food_id, presence: true
end
