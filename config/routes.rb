Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  get "/owner" => "owner#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  get"/clerkdash" => "owner#clerk"
  get"/salesdash" => "owner#sales"
  get"/userdash" => "owner#user"
  post "/users/clerk" => "users#clerk"
  get "/signout" => "sessions#destroy", as: :destroy_session
  resources :categories
  resources :users
  resources :sessions
  resources :menuitems
  resources :owner
end
