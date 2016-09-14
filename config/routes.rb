Rails.application.routes.draw do

  root 'items#index'

  resources :users, only: [:new, :create, :show]
  resources :dashboard, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items, only: [:index, :show]
  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#index'
  delete '/cart', to: "carts#destroy"
  get '/:category', to: 'categories#show', as: :category
end
