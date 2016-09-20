Rails.application.routes.draw do

  root 'items#index'

  resources :users, only: [:new, :create, :show]

  resources :orders, only: [:index, :show, :create]

  resource :dashboard, only: [:show]

  namespace :admin do
    resource :dashboard, only: [:show]
    resource :user, only: [:edit, :update]
    get 'orders/ordered', to: 'orders#index'
    get 'orders/paid', to: 'orders#index'
    get 'orders/cancelled', to: 'orders#index'
    get 'orders/completed', to: 'orders#index'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items, only: [:index, :show, :new, :create]
  put '/cart', to: 'carts#edit'
  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#index'
  delete '/cart', to: "carts#destroy"
  get '/:category', to: 'categories#show', as: :category
end
