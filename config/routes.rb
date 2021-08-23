# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  get '/add_pet', to: 'pet#add', as: 'pet'
  get '/add_location', to: 'address#add', as: 'location'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/sitters/:id', to: 'sitter_profiles#show'

  get '/owner_profile', to: 'owner_profiles#show'
end
