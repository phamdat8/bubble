Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do
    get '/login-qr/:code', to: 'users/sessions#login_qr'
  end
  

  root to: 'home#index'
  namespace :user do
    resources :posts
    resources :categories
    resources :lessons
    resources :completes
    root to: 'users#index'
    resource :users
    resources :documents
    resources :comments
  end
  
end
