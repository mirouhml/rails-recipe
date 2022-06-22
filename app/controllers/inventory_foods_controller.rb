class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
    @foods = current_user.foods
  end

  def create
    @foods = current_user.foods
    inventory_food = InventoryFood.new(inventory_food_params)
    inventory_food.inventory_id = params[:inventory_id]

    if inventory_food.save
      redirect_to user_inventory_path(current_user.id, params[:inventory_id]),
                  notice: 'Inventory food added succesfully'
    else
      redirect_to new_user_inventory_inventory_food_path(current_user.id, params[:inventory_id]),
                  alert: 'Duplicate entry. Please choose another food'

    end
  end

  def destroy
    inventory_details = InventoryFood.find_by(id: params[:id])
    inventory = Inventory.find_by(id: params[:inventory_id])
    if inventory_details.present?
      if inventory_details.destroy
        flash[:notice] = 'Item deleted'
      else
        flash[:alert] = 'Item was not deleted, please try again later.'
      end
    else
      flash[:alert] = 'Item was not found, please try again later.'
    end
    redirect_to inventory_path(inventory)
  end
end
