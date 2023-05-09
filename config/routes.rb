Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  resources :items do
    resources :orders, only: [:create, :index]
  end
  root to: "items#index"
end
