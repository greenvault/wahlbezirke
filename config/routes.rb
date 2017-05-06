Rails.application.routes.draw do
  resource :states
  resource :districts
  resource :precincts
  resource :municipalities
  root 'municipalities#index'
end
