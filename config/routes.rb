require 'sidekiq/web'

Rails.application.routes.draw do

  resources :food_trucks do
    resources :reviews, only: [:create, :new, :destroy, :edit, :update]
  end

  scope '/admin' do
    resources :food_trucks, only: [:destroy]
  end

  devise_for :users

  root to: "food_trucks#index"

  if Rails.env.development?
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
