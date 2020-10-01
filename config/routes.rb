Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "/search", to: "pages#search"
  get "/home", to: "pages#home"
  
end