Rails.application.routes.draw do

  root 'homes#top'
  get 'homes/about'
  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end

  resources :posts do
    resource :favorites, only: [:create, :destroy]
    get 'likes' => 'favorites#likes', as: 'likes'
    get 'liked' => 'favorites#liked', as: 'liked'
    resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
