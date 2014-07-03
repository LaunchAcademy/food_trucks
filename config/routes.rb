require 'sidekiq/web'

Rails.application.routes.draw do

  resources :food_trucks do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update] do
      member do
        post "upvote", to: "reviews#upvote"
        post "downvote", to: "reviews#downvote"
      end
    end
  end

  scope :admin do
    resources :food_trucks, only: [:destroy]
  end

  authenticate :user, lambda {|u| u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end

  devise_for :users

  root to: "food_trucks#index"
end
