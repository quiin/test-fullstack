Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get '/signin', to: 'sessions#new', as: 'signin'  
  get 'profiles', to: 'profiles#new'


  resources :profiles, except: [:index] do 	
  	resources :requisitions, except: [:destroy]  	
  end
  resources :sessions, only: [:new, :create, :destroy]

  root 'sessions#index'
end
