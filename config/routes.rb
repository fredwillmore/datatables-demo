Rails.application.routes.draw do
  resources :asteroids
  resources :comets
  root 'home#home'
end
