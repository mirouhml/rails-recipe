class InventoryFoodsController < ApplicationController
  def new; end

  def create; end

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
