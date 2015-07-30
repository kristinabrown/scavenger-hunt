Rails.application.routes.draw do
  resources :submissions, only: [:create, :index]
  resources :teams
  resources :hunts, only: [:create, :destroy]
end
