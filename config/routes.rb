Rails.application.routes.draw do

  root 'items#index'
  resources :items
    resources :comments

  resources :purchase

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get "mypages/index"
  get "mypages/logout"

  resource :card, only:[:index, :new, :show, :destroy]
end