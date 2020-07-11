Rails.application.routes.draw do
  root "roots#index"
  resources :sites, only: [:index]
  scope "/:user_name" do
    resources :sites, except: [:index]
  end
  resources :posts
  devise_for :users
end
