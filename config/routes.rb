Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get 'get_category_children_items', to: 'items#get_category_children'
      get 'get_category_grandchildren_items', to: 'items#get_category_grandchildren'
    end
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_status', defaults: { format: 'json' }
    end
    collection do
      get ':id/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get ':id/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :comments, only: [:create]
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
      end
    end
  end

  resources :categories, only: [:index, :show]

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

  devise_scope :user do
    get '/addresses', to: 'users/registrations#new_address'
    post '/addresses', to: 'users/registrations#create_address'
    get '/addresses/:id/edit', to: 'users/registrations#edit_address', as: 'edit_address'
    patch '/addresses/:id', to: 'users/registrations#update_address'
    put '/addresses/:id', to: 'users/registrations#update_address'
  end
  get "mypages/index"
  get "mypages/logout"

end