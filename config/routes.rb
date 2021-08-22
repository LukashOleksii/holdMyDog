# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  post '/add_pet', to: 'pet#create', as: 'pets'
  get '/add_pet', to: 'pet#new'

  post '/add_location', to: 'address#create', as: 'locations'
  get '/add_location', to: 'address#new'

  get '/sitters/:id', to: 'sitter_profiles#show'
  get '/owner_profile', to: 'owner_profiles#show'
end
