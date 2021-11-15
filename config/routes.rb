Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'home#index'
  namespace :user do
    resources :posts
    resources :categories
    resources :lessons
    resources :completes
    root to: 'users#index'
    resource :users
  end
  
end
