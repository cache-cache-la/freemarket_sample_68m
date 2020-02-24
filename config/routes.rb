Rails.application.routes.draw do
  get "mypages/index"
  get "mypages/logout"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  #住所登録をウィザード形式で表示させる
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :items, only: [:show]
  root "items#index"
  resources :items
    resources :comments

  # items/purchaseは画面を表示するための仮置きです
  resources :user, only:[:index, :edit, :destroy]
  resources :card, only:[:index, :new, :show]
end