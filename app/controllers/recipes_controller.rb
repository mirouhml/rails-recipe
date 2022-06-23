class RecipesController < ApplicationController
  def index
    @current_user = current_user
    @recipes = Recipe.where(user: @current_user)
  end

  def public
    @current_user = current_user
    @recipes = Recipe.where(public: true)
  end

  def set_public
    @recipe = Recipe.find_by(id: params[:recipe_id])
    if @recipe.present?
      if @recipe.public
        @recipe.public = false
      else
        @recipe.public = true
      end
      if @recipe.save
        flash[:notice] = "Recipe is now #{@recipe.public ? 'public' : 'private'}"
      else
        flash[:alert] = 'Recipe wasn\'t updated, please try again later.'
      end
    end
    redirect_back(fallback_location:"/")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
  end

  def create
    user = current_user
    recipe = Recipe.new(params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public))
    recipe.user = user
    respond_to do |format|
      format.html do
        if recipe.save
          flash[:success] = 'Recipe saved successfully'
          redirect_to recipes_url
        else
          flash[:error] = 'Error: recipe could not be saved'
          redirect_to new_recipes_url
        end
      end
    end
  end
end
