Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'outputs#index'
  resources :outputs do
    resources :comments, only: :create
    member do 
      get 'like'
    end
  end
  resources :users, only: :show
end
