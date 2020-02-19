Rails.application.routes.draw do
  get 'mypages/index'
  get "mypages/logout"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resource :items, only: [:show]
  root "top#index"
  get 'logout/index'
  resources :user, only:[:index, :edit, :destroy]
  resources :card, only:[:index, :new, :show]
end