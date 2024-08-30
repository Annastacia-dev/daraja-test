# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/:action', to: 'home#action'
  get '/mpesa_express', to: 'home#mpesa_express'

  post '/stkpush', to: 'mpesa#stkpush', as: 'stkpush'
  post '/stkquery', to: 'mpesa#stkquery', as: 'stkquery'
  post '/callback', to: 'mpesa#callback', as: 'callback'
end
