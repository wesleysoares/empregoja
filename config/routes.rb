Rails.application.routes.draw do
  resources :jobs, only: [:show]
  root 'jobs#index'
end
