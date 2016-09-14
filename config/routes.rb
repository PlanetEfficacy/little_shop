Rails.application.routes.draw do

  resources :items, only: [:index, :show]
  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#index'
  delete '/cart', to: "carts#destroy"
  get '/:category', to: 'categories#show', as: :category
end
