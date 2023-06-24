Rails.application.routes.draw do
  resources :operations
  resources :categories
  root "categories#index"
end
