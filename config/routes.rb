Rails.application.routes.draw do
  devise_for :users

    resources :foods, only: [:index, :new, :show, :create, :destroy]
    resources :recipes, only: [:index, :show]
    resources :public_recipes, only: [:index]
    resources :inventories, only: [:index, :show, :new, :create, :destroy] do
      resources :inventory_foods, only: [:create, :destroy]
    end
  
    root 'foods#index'
end
