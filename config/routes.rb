Rails.application.routes.draw do
  devise_for :users
  root       'dashboard#show'
  resources  :friendships, only: [:create, :update, :destroy]
  resources  :users
  resources  :posts do
    member do
      put "like", to: "likes#create"
      put "dislike", to: "likes#destroy"
    end
  end
  get        'requests' => 'friendships#index', as: :requests
  resources  :comments, only: [:create, :destroy]
end
