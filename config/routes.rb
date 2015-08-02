Rails.application.routes.draw do
  get '/admin_dashboard', to: "admin#dashboard"

  root "admin#dashboard"

  resources :submissions, only: [:create, :index, :update]
  get '/latest-submission', to: 'submissions#latest_submission'
  resources :teams, only: [:create, :update, :show, :index]
  resources :hunts, only: [:create, :destroy, :index]
end
