Rails.application.routes.draw do
  get 'messages/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index, :create]
    resources :messages, only: [:create]
  end
end
