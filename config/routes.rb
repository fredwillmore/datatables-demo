Rails.application.routes.draw do
  resources :asteroids, only: :index
  resources :comets, only: :index
  root 'home#home'
end
