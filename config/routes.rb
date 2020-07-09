Rails.application.routes.draw do
  root "roots#index"
  get "/about" ,to: "roots#about", as: "about"
  resources :posts
end
