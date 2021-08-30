# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get  '/add_pet',    to: 'pets#new',     as: :new_pet
  post '/add_pet',    to: 'pets#create',  as: :pet
  delete '/delete_pet/:id', to: 'pets#destroy', as: :delete_pet
  put '/update_pet/:id', to: 'pets#update', as: :update_pet

  get '/add_location', to: 'addresses#new', as: :new_location
  post '/add_location', to: 'addresses#create', as: :location

  get  '/service_offering', to: 'availiabilities#new', as: :new_service_offering
  post '/service_offering', to: 'availiabilities#create', as: :service_offering
  delete '/delete_service_offering/:id', to: 'availiabilities#destroy', as: :delete_service_offering

  post '/comment', to: 'comments#create', as: :comment

  get '/sitters/:id', to: 'sitter_profiles#show', as: :sitter
  put '/sitters/:id/update', to: 'sitter_profiles#update', as: :update_sitter

  get '/owners/:id', to: 'owner_profiles#show', as: :owner
  put '/owners/:id/update', to: 'owner_profiles#update', as: :update_owner

  get '/search', to: 'sitter_profiles#search', as: :search

  get '/inbox/:id', to: 'orders#index', as: :inbox
  delete '/delete_order/:id', to: 'orders#destroy', as: :delete_order
  put '/cancel_order/:id', to: 'orders#cancel_order', as: :cancel_order
  put '/confirm_order/:id', to: 'orders#confirm_order', as: :confirm_order

  get  '/order', to: 'orders#new', as: :new_order
  post '/order/:id', to: 'orders#create', as: :order
end
