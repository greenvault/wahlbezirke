Rails.application.routes.draw do
  devise_for :users, controllers: { saml_sessions: 'saml_sessions' }
  root 'states#index'
  get 'faq', to: 'pages#faq'
  get 'search', controller: :main
  get 'login', to: 'pages#login'
  get 'choose_election', to: 'pages#choose_election'
  get 'municipalities', to: 'states#index'

  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
end
