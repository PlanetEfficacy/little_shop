Rails.application.routes.draw do

  resources :items, only: [:index]

  get ':categories', to: 'categories#show', as: :category
end
