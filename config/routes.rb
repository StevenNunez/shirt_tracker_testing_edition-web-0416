Rails.application.routes.draw do
  root 'home#index'

  resources :wearings, only: [:create]
end
