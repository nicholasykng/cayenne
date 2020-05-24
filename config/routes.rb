Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :index] do
    resources :recipes
  end
  resources :recipes
  get "/login" => 'sessions#new'
  post "/login" => 'sessions#create'
  get "/logout" => 'sessions#destroy'
  root "sessions#index"
  get '/auth/facebook/callback' => 'sessions#create'
  
    
  resources :categories
  resources :ingredients
  resources :comments
  resources :ratings
end
