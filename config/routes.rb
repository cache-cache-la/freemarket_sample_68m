Rails.application.routes.draw do
  get "mypages/index"
  get "mypages/logout"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :items do
    resources :comments, only: :create
  end
  root "items#index"
  get 'logout/index'
  get 'sell/sell'
  get "logout/index"
  get "items/purchase"
  # items/purchaseは画面を表示するための仮置きです
  resources :user, only:[:index, :edit, :destroy]
  resources :card, only:[:index, :new, :show]
end