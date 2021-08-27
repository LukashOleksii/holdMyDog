# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get  '/add_pet', to: 'pets#new',    as: :new_pet
  post '/add_pet', to: 'pets#create', as: :pet

  get  '/add_location', to: 'addresses#new',    as: :new_location
  post '/add_location', to: 'addresses#create', as: :location

  get  '/service_offering', to: 'availiabilities#new', as: :new_service_offering
  post  '/service_offering', to: 'availiabilities#create', as: :service_offering

  get '/sitters/:id', to: 'sitter_profiles#show', as: :sitter
  get '/owners/:id',  to: 'owner_profiles#show',  as: :owner
end
