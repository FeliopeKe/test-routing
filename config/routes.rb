Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/organizations', to: 'organizations#index'

  put '/set_driver_and_vehicle', to: 'organizations#set_driver_and_vehicle'

  root to: 'organizations#index'

end
