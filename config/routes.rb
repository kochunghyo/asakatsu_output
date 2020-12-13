# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  post '/outputs/guest_sign_in', to: 'outputs#new_guest'

  root to: 'outputs#index'

  resources :outputs do
    resources :comments, only: :create
    member do
      get 'like'
    end
  end
  resources :users, only: :show do
    member do
      get :following, :followers
    end
  end
  resources :relationships do
    collection do
      get 'follow'
    end
  end
end
