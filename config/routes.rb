Rails.application.routes.draw do
  resources :meetings
  devise_for :users
  root to: 'questions#index'
  resources :questions do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
