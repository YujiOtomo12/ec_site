Rails.application.routes.draw do
  devise_for :users
  resources :tags
  resources :books
  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create] do
    collection do
      get :confirm
    end
    member do
      get :complete
    end
  end
  resources :line_items, only: :create
  resources :carts, only: [:show, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get :mypage, to: 'mypage#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
