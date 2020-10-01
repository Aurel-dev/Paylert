Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/search", to: "pages#search"
  get "/home", to: "pages#home"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
end