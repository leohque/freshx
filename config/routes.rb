Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: :create
    resources :likes, only: :create
  end

  resources :comments, only: [:update, :destroy]
  resources :likes, only: :destroy



end
