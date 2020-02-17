Rails.application.routes.draw do
  get 'mypages/index'
  get "mypages/logout"
  get "mypages/card"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
end