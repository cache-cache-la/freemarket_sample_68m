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
  resources :user, only:[:index, :edit, :destroy]
end