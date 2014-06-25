Rails.application.routes.draw do

  resources :food_trucks, only: [:index, :show, :create, :new] do
    resources :reviews, only: [:create, :new, :destroy]
  end

  devise_for :users

  root to: "food_trucks#index"

end
