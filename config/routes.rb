Rails.application.routes.draw do
  resources :submissions, only: [:create, :index, :update]
  get '/latest-submission', to: 'submissions#latest_submission'
  resources :teams, only: [:create, :update, :show, :index]
  resources :hunts, only: [:create, :destroy]
end
