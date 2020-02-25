Rails.application.routes.draw do
  get "mypages/index"
  get "mypages/logout"
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_status', defaults: { format: 'json' }
    end
  end

  root "top#index"
#以下、後ほど要修正
  resource :items
  root "items#index"
  get 'logout/index'
  get "logout/index"
  get "items/purchase"
  # items/purchaseは画面を表示するための仮置きです
  resources :user, only:[:index, :edit, :destroy]
  resources :card, only:[:index, :new, :show]
end