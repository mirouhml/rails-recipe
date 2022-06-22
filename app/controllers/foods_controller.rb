class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @food = Food.all
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
      flash[:notice] = 'Food was successfully created'
      redirect_to foods_path
    else
      render :new
      flash[:alert] = 'Food wasn\'t created, please try again later.'
    end
  end

  def destroy
    user = current_user
    food = Food.find_by(id: params[:id])
    if food.present?
      if food.destroy
        flash[:notice] = 'Food was successfully deleted'
      else
        flash[:alert] = 'Food was not deleted, please try again later.'
      end
    else
      flash[:alert] = 'Food was not found, please try again later.'
    end
    redirect_to foods_path(user)
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
