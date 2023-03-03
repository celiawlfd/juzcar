Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "houses#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :houses do
    resources :reservations, only: [:create]
  end

  resources :houses do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]

  get "/mydashboard", to: "dashboards#mydashboard"
end
