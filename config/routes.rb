Rails.application.routes.draw do
  resources :submissions, only: [:create, :index]
  resources :teams, only: [:create, :update, :show, :index]
end
