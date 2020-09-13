Rails.application.routes.draw do
  
  resources :room_messages
  resources :rooms
  root 'rooms#index'
  get "/index",to: 'home#index'
  devise_for :users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: :json } do
    devise_scope :user do
      post '/login', to: "sessions#create"
      delete '/logout', to: "sessions#destroy"
      get '/signed_in', to: "sessions#signed_in"
      get '/currently_user', to: "sessions#currently_user"
      get '/rooms/:id', to: "rooms#show"
      get '/get_user_type/:id', to: "users#get_user_type"
      get '/get_user_by_username/:username', to: "users#get_user_by_username"
      get '/get_user_by_id/:id', to: "users#get_user_by_id"
    end
  end

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  resource :charge_user, only: [:new, :create]

  resources :room_messages
  resources :rooms

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
