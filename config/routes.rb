Rails.application.routes.draw do
  get 'reports', to: 'reports#index'
  get 'report_by_category', to: 'reports#report_by_category'
  get 'report_by_dates', to: 'reports#report_by_dates'
  post 'report_by_category', to: 'reports#report_by_category'
  post 'report_by_dates', to: 'reports#report_by_dates'
  resources :operations
  resources :categories
  root "main#index"
end
