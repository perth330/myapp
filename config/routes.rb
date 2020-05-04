Rails.application.routes.draw do
  resources :meetings
  devise_for :users
  root to: 'questions#index'
  resources :questions
  resources :users, only: :show
end
