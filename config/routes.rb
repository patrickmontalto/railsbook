Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#show'
  resources :dashboard,   only: [:show]
  resources :friendships, only: [:create, :update, :destroy]
  resources :users
  resources :posts
  get 'requests' => 'friendships#index', as: :requests
  resources :likes, only: [:create, :destroy]
  # only allowing comments to be created or deleted
  resources :comments, only: [:create, :destroy]
end
