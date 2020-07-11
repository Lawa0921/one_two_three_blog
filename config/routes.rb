Rails.application.routes.draw do
  root "roots#index"
  get "/about" ,to: "roots#about", as: "about"
  resources :posts
  resources :sites, only: [:index]
  devise_for :users
end
