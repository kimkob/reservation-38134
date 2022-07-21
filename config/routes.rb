Rails.application.routes.draw do
  root to: 'chalender#index'
  devise_for :users
  resources :users, only: :new
end
