Rails.application.routes.draw do
  devise_for :users
  root 'pages#login'
  get 'faq', to: 'pages#faq'
  get 'login', to: 'pages#login'
  get 'municipalities', to: 'states#index'

  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
end
