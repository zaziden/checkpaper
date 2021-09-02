Rails.application.routes.draw do
  devise_for :users
  root to: "toppages#index"
  resources :users, only: [:edit, :update]
  resources :menus
  resources :guests
  resources :staffs
end
