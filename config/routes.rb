Rails.application.routes.draw do
  resources :submissions, only: [:create, :index]
  resources :hunts, only: [:create, :destroy]
end
