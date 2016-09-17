Rails.application.routes.draw do

  root 'items#index'

  resources :users, only: [:new, :create, :show]

  resources :orders, only: [:index, :show]

  resource :dashboard, only: [:show]

  namespace :admin do
    resource :dashboard, only: [:show]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items, only: [:index, :show]
  put '/cart', to: 'carts#edit'
  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#index'
  delete '/cart', to: "carts#destroy"
  get '/:category', to: 'categories#show', as: :category
end
