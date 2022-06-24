class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:recipe_foods).where(public: true).order(id: :desc)
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: @recipes.ids)
  end
end
