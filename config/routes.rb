Rails.application.routes.draw do

  root 'items#index'

  get '/login', to: 'sessions#new'

  resources :items, only: [:index, :show]
  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#index'
  get ':categories', to: 'categories#show', as: :category

end
