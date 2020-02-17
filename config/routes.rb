Rails.application.routes.draw do
  resources :users
  get "/login" => 'sessions#new'
  post "/login" => 'sessions#create'
  get "/logout" => 'sessions#destroy'
  root "users#index"
  get '/auth/facebook/callback' => 'sessions#create'
  resources :recipes do
    resources :categories, only: [:index, :create, :new]
  end
  resources :categories do
    resources :recipes, only: [:index, :show]
  end
end
