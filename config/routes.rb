Rails.application.routes.draw do
  root 'products#index'

  resources :brands
  resources :categories
  resources :products
  resources :cart_items, only: [:index, :create, :update, :destroy]

  get 'pages/*path', to: 'pages#show', as: :builder_page

  namespace :admin do
    resources :products
  end
end
