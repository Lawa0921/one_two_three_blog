Rails.application.routes.draw do
  root "roots#index"
  resources :sites, only: [:index, :new, :create]
  scope "/:user_name" do
    resources :sites, except: [:index, :new, :create] do
       resources :posts
    end
  end
  devise_for :users, controllers: {
        registrations: 'user/registrations'
      }
end
