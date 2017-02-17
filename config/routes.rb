Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/*page", to: "pages#show"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show, :create]
end
