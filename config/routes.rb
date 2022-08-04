Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
 
  root to: 'calendar#index'
  resources :users, only: :new
  resources :reservations, only: :new
end
