require 'rails_helper'

RSpec.describe Food, type: :model do
before(:each) do
    @user = User.new(name: 'Test User', email: 'exemple@gmail.com', password: 'password')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: Food.new(name: 'Test Food', user: @user), quantity: 10)
  @food1 = Food.create(name: 'Turkey', measurement_unit: 'kg', price: 10, user: @user)
      RecipeFood.create(quantity: 3, recipe: @recipe, food: @food1)

   @food2 = Food.create(name: 'Potato', measurement_unit: 'kg', price: 5, user: @user)
      RecipeFood.create(quantity: 1, recipe: @recipe, food: @food2)

  @food3 = Food.create(name: 'Mayonnaise', measurement_unit: 'unit', price: 2, user: @user)
      RecipeFood.create(quantity: 1, recipe: @recipe, food: @food3)
  end

    it 'recipe belongs to a user' do
    expect(@recipe.user_id).to eq(@user.id)
    end
     it 'food has correct recipe' do
    expect(@food1.recipe).to eq(@recipe)
    expect(@food2.recipe).to eq(@recipe)
    expect(@food3.recipe).to eq(@recipe)
  end

  it 'reciped food has the correct recipe' do
    expect(@recipe_food.food).to eq(@recipe_food.food)
  end

  it 'has a quantity' do
    expect(@recipe_food.quantity).to eq(10)
  end
end