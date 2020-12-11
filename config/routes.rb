# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users

  resources :users, only: %i[show edit update destroy] do
    resource :relationships, only: %i[create destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
    get 'liked' => 'favorites#userliked', as: 'liked'
  end

  resources :posts do
    resource :favorites, only: %i[create destroy]
    get 'liked' => 'favorites#liked', as: 'liked'
    resources :post_comments, only: %i[create destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
