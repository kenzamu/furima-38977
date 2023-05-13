Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  resources :items do
    resources :orders, only: [:create, :index]
    resources :comments, only: :create
  end
  root to: "items#index"
end
