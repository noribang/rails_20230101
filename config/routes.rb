Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # # GET request all
  # get "/birds", to: "birds#index"
  # # GET request by :id
  # get "/birds/:id", to: "birds#show"

  # # Generates all routes. 
  # resources :birds
  # Generate using only:
  resources :birds, only: [:index, :show, :create]

end
