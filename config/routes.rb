Rails.application.routes.draw do
  get "/signup" => 'users#new'
  post "/signin" => 'users#create'
  resources :users, only: [:show]
  get "/login" => 'sessions#new'
  post "/login" => 'sessions#create'
  get "/logout" => 'sessions#destroy'
  root "users#index"
end
