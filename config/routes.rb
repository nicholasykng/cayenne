Rails.application.routes.draw do
  get "/signup" => 'users#new'
  post "/signin" => 'users#create'
  resources :users
  get "/login" => 'sessions#new'
  post "/login" => 'sessions#create'
end
