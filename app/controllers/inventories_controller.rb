class InventoriesController < ApplicationController
  def index
    @user = current_user
    @inventories = @user.inventories
  end

  def show
    @inventory = Inventory.find_by(id: params[:id])
    @inventory_foods = @inventory.inventory_foods
  end

  def new
    @inventory = Inventory.new
  end

  def create
    user = current_user
    @inventory = Inventory.new(inventory_params)
    @inventory.user = user
    if @inventory.save
      flash[:notice] = 'Inventory created'
      redirect_to inventory_path(@inventory)
    else
      render :new
      flash[:alert] = 'Inventory wasn\'t created, please try again later.'
    end
  end

  def destroy
    user = current_user
    inventory = Inventory.find_by(id: params[:id])
    if inventory.present?
      if inventory.destroy
        flash[:notice] = 'Inventory deleted'
      else
        flash[:alert] = 'Inventory was not deleted, please try again later.'
      end
    else
      flash[:alert] = 'Inventory was not found, please try again later.'
    end
    redirect_to inventory_path(user)
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
