Rails.application.routes.draw do
  devise_for :users
  root 'states#index'
  get 'faq', to: 'pages#faq'
  get 'login', to: 'pages#login'
  get 'municipalities', to: 'states#index'

  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
end
