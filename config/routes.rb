Rails.application.routes.draw do

  resources :items, only: [:index]

  # resources :categories, param: :name, only: [:show]
  # How do we just get the category name to be the path??
  # resources :categories, only: [:show]

  get ':categories', to: 'categories#show', as: :category
end
