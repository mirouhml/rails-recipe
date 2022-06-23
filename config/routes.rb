Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :foods, only: [:index, :new, :show, :create, :destroy]
  resources :recipes do
    post 'set_public', to: 'recipes#set_public'
    resources :recipe_foods
  end
  resources :public_recipes, only: [:index]
  resources :inventories_list, only: [:index]
  delete '/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#destroy', as: "delete_recipe_food"
  resources :inventories, only: [:index, :show, :new, :create, :destroy] do
    resources :inventory_foods, only: [:create, :destroy]
  end

  root 'foods#index'
end
