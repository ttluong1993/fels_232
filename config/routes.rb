Rails.application.routes.draw do
  root "pages#show", page: "home"
  get "/pages/*page", to: "pages#show"
  get "/signup", to: "users#new"
  resources :users, only: [:show, :create]
end
