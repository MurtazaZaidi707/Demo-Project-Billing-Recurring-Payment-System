# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'plans/index'
  # get 'home/index'
  devise_for :users
  resources :subscribes
  resources :invoices
  resources :usages

  resources :payments do
    get :usage
    post :usage
  end

  resources :plans do
    resources :features do
      get :usage
      post :usage
    end
  end

  get '/user' => 'plan#index', :as => :user_root

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  post "checkout/create", to: "checkout#create"
end
