Rails.application.routes.draw do
  devise_for :users
  get 'faq', to: 'pages#faq'

  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
  root 'states#index'
end
