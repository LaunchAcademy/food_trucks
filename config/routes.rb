Rails.application.routes.draw do

  resources :food_trucks do
    member do
      post "upvote", to: "food_trucks#upvote"
      post "downvote", to: "food_trucks#downvote"
    end
    resources :reviews, only: [:create, :new, :destroy, :edit, :update] do
      member do
        post "upvote", to: "reviews#upvote"
        post "downvote", to: "reviews#downvote"
      end
    end
  end

  scope '/admin' do
    resources :food_trucks, only: [:destroy]
  end

  devise_for :users

  root to: "food_trucks#index"

end
