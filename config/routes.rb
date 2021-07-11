# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :auth do
    post :sign_in, to: '/authentication#sign_in'
    delete :sign_out, to: '/authentication#sign_out'
  end

  resources :products
  resources :categories
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
