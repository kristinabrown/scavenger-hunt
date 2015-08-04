Rails.application.routes.draw do
  root "staticpages#landing"
  get '/dashboard', to: "admin#dashboard"

  resources :submissions, only: [:create, :index, :update]
  get '/latest-submission', to: 'submissions#latest_submission'
  resources :teams, only: [:create, :update, :show, :index]
  resources :hunts, only: [:create, :destroy, :index]
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
