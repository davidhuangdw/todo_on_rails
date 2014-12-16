Rails.application.routes.draw do

  resources :todos

  resources :projects

  resources :memberships
  resources :teams

  resources :sessions, only:[:new, :create, :destroy]
  get 'login' => "sessions#new", as: 'login'
  get 'logout' => "sessions#destroy", as: 'logout'

  resources :users
  get 'sign_up' => "users#new", as: 'sign_up'

  root 'users#index'
end
