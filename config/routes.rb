Rails.application.routes.draw do

  resources :events

  resources :comments
  resources :todos
  resources :projects
  resources :memberships
  resources :teams do
    get 'events'
  end

  resources :sessions, only:[:new, :create, :destroy]
  get 'login' => "sessions#new", as: 'login'
  get 'logout' => "sessions#destroy", as: 'logout'

  resources :users do
    get 'open_team'
    get 'switch_team'
  end
  get 'sign_up' => "users#new", as: 'sign_up'

  root 'users#index'
end
