Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#delete", as: :destroy_session

  post "/menu_items/:id/cart" => "cart#add", as: :cart_add_item
  delete "/menu_items/:id/cart" => "cart#remove", as: :cart_remove_item

  resources :cafe
  resources :menu_items
  resources :menu
  resources :order
  resources :users
  resources :invoices
end
