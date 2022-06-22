class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = current_user.foods.new
  end

  def create
    @food = current_user.foods.create(food_params)

    if @food.save
      redirect_to new_food_path
    else
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to new_food_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
