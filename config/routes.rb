Rails.application.routes.draw do
  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
  root 'states#index'
end
