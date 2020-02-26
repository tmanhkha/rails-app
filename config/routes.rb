Rails.application.routes.draw do
  resources :microposts
  resources :users, except: [:new]
  get '/signup', to: 'users#new'
  root 'home#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :search, only: :index
end
