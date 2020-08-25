Rails.application.routes.draw do
  
  resources :room_messages
  resources :rooms
  root 'rooms#index'
  get "/index",to: 'home#index'
  devise_for :users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  namespace :api do
    devise_scope :user do
      post '/signup', to: "registrations#create"
      post '/login', to: "sessions#create"
      delete '/logout', to: "sessions#destroy"
      get '/signed_in', to: "sessions#signed_in"
      get '/currently_user', to: "sessions#currently_user"
      get '/rooms/:id', to: "rooms#show"
      patch '/user', to: "users#update"
    end
  end

  resources :room_messages
  resources :rooms

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
