Rails.application.routes.draw do

  root "items#index"
  resources :items
    resources :comments

  resource :purchase

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resource :user, only: :index

   #住所登録をウィザード形式で表示させる
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :card, only: [:new, :show, :destroy] do
    collection do
      post 'show', to: 'card#showing'
      post 'pay', to: 'card#pay'
    end
  end

  # 仮置き
  get "mypages/index"
  get "mypages/logout"

end