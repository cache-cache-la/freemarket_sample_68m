Rails.application.routes.draw do
  get 'mypages/index'
  get "mypages/logout"
  get "mypages/card"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resource :items, only: [:show]
  root "top#index"
  get 'logout/index'
  get 'sell/sell'
  get "logout/index"
  get "items/purchase"
  # items/purchaseは画面を表示するための仮置きです
  resources :user, only:[:index, :edit, :destroy]
end