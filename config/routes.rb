Rails.application.routes.draw do
  devise_for :users
  root to: "houses#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :houses do
    resources :reservations, only: [:create]
  end
end
