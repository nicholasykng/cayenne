Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show] do
    resources :recipes, only: [:index, :create, :new, :show, :update, :edit]
  end
  resources :recipes
  get "/login" => 'sessions#new'
  post "/login" => 'sessions#create'
  get "/logout" => 'sessions#destroy'
  root "users#index"
  get '/auth/facebook/callback' => 'sessions#create'
  
    
  resources :categories
  resources :ingredients
  resources :comments
  resources :ratings
end
