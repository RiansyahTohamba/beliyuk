Rails.application.routes.draw do
  resources :orders
  get 'order/is_paid/:id', to: 'orders#is_paid', as: 'order_is_paid'
  resources :line_items
  resources :carts
  resources :charges

  resources :merchants, only: [:show]
  get 'product/:id', to: 'products#show', as: 'product'
  delete 'product/:id', to: 'products#destroy', as: 'product_destroy'
  get 'products/new_arrivals', to: 'products#new_arrivals'

  get 'products/most_populars', to: 'products#most_populars'

  get 'products/official_brands', to: 'products#official_brands'

  root 'home#index'

  devise_for :users, ActiveAdmin::Devise.config
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: :admin)
  ActiveAdmin.routes(self)
end
