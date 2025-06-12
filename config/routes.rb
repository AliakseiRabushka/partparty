Rails.application.routes.draw do
  root 'products#index'

  resources :brands
  resources :categories
  resources :products
  resources :cart_items, only: [:index, :create, :update, :destroy]

  namespace :admin do
    resources :products
  end
end
