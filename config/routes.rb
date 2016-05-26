RottenTomatoes::Application.routes.draw do
  get 'users/index'

  get 'admin/index'
  get 'admin/users'
  get 'admin/new'
  get 'admin/show'
  get 'admin/edit'
  get 'admin/destroy'
  get 'admin/users'
  get 'admin/show'
  get 'admin/edit'
  get 'admin/destroy'
  get "reviews/new"
  get "reviews/create"
  get "sessions/new"
  get "sessions/create"
  get "users/new"
  get "users/create"
  resources :movies do 
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'

  namespace :admin do
    resources :users
    root to: 'admin/users#index'
  end
end
