Rails.application.routes.draw do
  devise_for :users
  root to: 'outputs#index'
  resources :outputs do
    resources :comments, only: :create
    member do 
      get 'like'
    end
  end
  resources :users, only: :show
end
