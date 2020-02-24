Rails.application.routes.draw do

  root 'items#index'
  resources :items
    resources :comments

  resources :purchase

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  #住所登録をウィザード形式で表示させる
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  # items/purchaseは画面を表示するための仮置きです
  resources :user, only:[:index, :edit, :destroy]

  get "mypages/index"
  get "mypages/logout"

  resource :card, only:[:index, :new, :show, :destroy]

end