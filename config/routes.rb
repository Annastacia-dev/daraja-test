# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  get '/:action', to: 'home#action'

  post '/stkpush', to: 'mpesa#stkpush'
  post '/stkquery', to: 'mpesa#stkquery'
end
