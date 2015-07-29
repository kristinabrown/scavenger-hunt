Rails.application.routes.draw do
  resources :submissions, only: [:create, :index]
end
