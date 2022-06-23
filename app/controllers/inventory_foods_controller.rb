class InventoryFoodsController < ApplicationController
  def new
    @inventory_food = InventoryFood.new
    @inventory = Inventory.find_by(id: params[:inventory_id])
    @foods = Food.excluding(@inventory.foods)
  end

  def create
    inventory = Inventory.find_by(id: params[:inventory_id])
    inventory_food = InventoryFood.new(params.require(:inventory_food).permit(:food_id, :quantity))
    inventory_food.inventory = inventory
    respond_to do |format|
      format.html do
        if inventory_food.save
          flash[:success] = 'Ingredient saved successfully'
          redirect_to inventory_url(inventory.id)
        else
          flash[:error] = 'Error: Ingredient could not be saved'
          redirect_to new_inventory_inventory_food_url
        end
      end
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
