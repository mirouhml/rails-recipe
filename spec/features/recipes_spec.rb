require 'rails_helper'

RSpec.describe Food, type: :model do
before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: Food.new(name: 'Test Food', user: @user), quantity: 10)

  end

    it 'recipe belongs to a user' do
    expect(@recipe.user_id).to eq(@user.id)
    end

  it 'reciped food has the correct recipe' do
    expect(@recipe_food.recipe).to eq(@recipe)
  end
end