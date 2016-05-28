RottenTomatoes::Application.routes.draw do
  
  resources :movies do 
    resources :reviews
  end
  
  resources :users, only: [:show, :new, :create]
  
  resource :session, only: [:new, :create, :destroy]

  namespace :admin do
    resources :users
  end

  root to: 'movies#index'

end

