Rails.application.routes.draw do
  root "pages#show", static_page: "home"
  get "/pages/*static_page", to: "pages#show"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to:"sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: [:new, :destroy]
end
