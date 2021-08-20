# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  get '/add_pet', to: 'pet#add', as: 'pet'
  get '/add_location', to: 'address#add', as: 'location'
end
