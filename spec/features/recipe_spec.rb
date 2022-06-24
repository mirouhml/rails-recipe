require 'rails_helper'

RSpec.describe Recipe, type: :model do

  before(:each) do
    @user = User.new(name: 'Test User', email: 'example@gmail.com', password: 'password')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
  end

  it 'belongs to a user' do
    expect(@recipe.user).to eq(@user)
  end
  it 'has a name' do
    expect(@recipe.name).to eq('Test Recipe')
  end

  it 'has many recipe_foods' do
    @food = Food.new(name: 'Test Food', measurement_unit: 'kilo', price: 35, user: @user)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food)
    @recipe.recipe_foods << @recipe_food
    expect(@recipe.recipe_foods).to eq([@recipe_food])
  end

  it 'destroys the food when the recipe is destroyed' do
    @recipe.destroy
    expect(@recipe.destroyed?).to eq(true)
  end
end
