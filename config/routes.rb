Rails.application.routes.draw do
  root "roots#index"
  resources :posts
end
