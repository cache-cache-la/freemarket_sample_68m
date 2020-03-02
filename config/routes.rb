Rails.application.routes.draw do

  root 'items#index'

  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
    end
  end
  resources :items do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_status', defaults: { format: 'json' }
    end
    resources :comments, only: :create
  end
  resources :purchase

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :card, only: [:new, :show, :destroy] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
    end
  end

  #住所登録をウィザード形式で表示させる
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  get "mypages/index"
  get "mypages/logout"
  get "category/index"
end