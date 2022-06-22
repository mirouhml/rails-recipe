Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'food#index'
  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
  end
  resources :food, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_foods
  end
  resources :public_recipes, only: [:index]
  resources :inventories_list, only: [:index]
  delete '/recipes/:recipe_id/recipe_foods/:id', to: 'recipe_foods#destroy', as: "delete_recipe_food"
end
