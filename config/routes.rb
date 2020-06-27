require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
  	scope module: :v1, constraints: ApiConstraints.new(version: 1, default: :true) do
      resources :posts
  	end
  end

  devise_for :users
  resources :posts
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
