Rails.application.routes.draw do
  get "mypages/index"
  get "mypages/logout"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resource :items, only: [:show]
  root "top#index"
  get "logout/index"
  get "items/purchase"
  # items/purchaseは画面を表示するための仮置きです
  resources :user, only:[:index, :edit, :destroy]
  resources :card, only:[:index, :new, :show]
end