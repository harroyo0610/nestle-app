Rails.application.routes.draw do
  
  root 'home#index'
  devise_for :users
  namespace :api do
    devise_scope :user do
      post '/signup', to: "registrations#create"
      post '/login', to: "sessions#create"
      delete '/logout', to: "sessions#destroy"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
