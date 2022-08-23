# frozen_string_literal: true

Rails.application.routes.draw do
  get 'usages/index'
  get 'subscribes/index'
  get 'features/index'
  get 'plans/index'
  # get 'home/index'
  devise_for :users
  resources :subscribes
  resources :usages
  resources :transactionusers

  resources :plans do
    resources :features
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
