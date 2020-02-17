Rails.application.routes.draw do
  get 'top/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resource :items, only: [:show]
  root "top#index"
  get 'logout/index'
  resources :user, only:[:index, :edit, :destroy]
end