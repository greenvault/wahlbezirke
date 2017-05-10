Rails.application.routes.draw do
  resources :states
  resources :districts
  resources :precincts
  resources :municipalities
  root 'municipalities#index'
end
