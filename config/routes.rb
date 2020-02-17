Rails.application.routes.draw do
  get 'top/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root "top#index"
  get 'logout/index'
  resources :user, only:[:index, :edit, :destroy]
end