Rails.application.routes.draw do
  resources :mpesas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/stkpush", to: "mpesas#stkpush"

  # post "/callback_url", to: "mpesas#callback_url"

  post "/polling_payment", to: "mpesas#polling_payment"


end
