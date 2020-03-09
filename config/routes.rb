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


  resources :grows do
    resources :plants, only: [:new, :create, :edit, :destroy]
  end


  resources :posts

  get 'users/edit_profile', to: 'users#edit_profile', as: 'edit_profile'
  post 'users/edit_profile', to: 'users#update_profile'
  get 'users/:user_id', to: 'users#show', as: 'user_profile'


end
