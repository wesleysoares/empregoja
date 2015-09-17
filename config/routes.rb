Rails.application.routes.draw do
  get 'companies/new'

  root 'jobs#index'
  resources :jobs, only: [:index, :show, :new, :create]
  resources :companies, only: [:new, :create, :show]
  resources :categories, only: [:show]
end
