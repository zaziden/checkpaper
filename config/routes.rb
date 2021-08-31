Rails.application.routes.draw do
  devise_for :users
  root to: "toppages#index"
  resources :users, only: [:edit, :update]
end
