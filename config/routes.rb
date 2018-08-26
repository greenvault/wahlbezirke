Rails.application.routes.draw do
  devise_for :users, controllers: { saml_sessions: 'saml_sessions' }
  root 'states#index'
  get 'faq', to: 'pages#faq'
  get 'search', controller: :main
  get 'login', to: 'pages#login'
  get 'election', to: 'pages#choose_election'
  get 'municipalities', to: 'states#index'
  get 'wartung', to: 'pages#construction'
  get 'sessions/create', to: 'sessions#create'
  get 'election_display', to: 'pages#election_display'

  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
end
