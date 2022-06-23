class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @inventory = Inventory.find_by(id: params[:inventory_id])
    @recipe_foods = []
    if @inventory.inventory_foods.empty?
      @recipe_foods = @recipe.recipe_foods
    else
      @inventory.inventory_foods.each do |inventory_food|
        @recipe.recipe_foods.each do |recipe_food|
          next unless recipe_food.food_id == inventory_food.food_id && (recipe_food.quantity > inventory_food.quantity)

          food = recipe_food
          food.quantity -= inventory_food.quantity
          @recipe_foods << food
        end
      end
      @recipe_foods += @recipe.recipe_foods - @inventory.inventory_foods
    end
    @total_price = 0
    @recipe_foods.each { |item| @total_price += item.quantity * item.food.price }
  end
end
