Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/profile", to: "profiles#show"

  get "search", to: "pages#search"
  get "home", to: "pages#home"

  resources :products do
    resources :paylerts ,only: [:create , :new, :delete]
    # resources :users, only: []
  end

  get "/search", to: "pages#search"
  get "/profile", to: "profiles#show"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  delete "/strigowl/:id", to: "strigowls#destroy",  as: :delete_strigowl
  
  resources :users do
    resources :profile
  end
end