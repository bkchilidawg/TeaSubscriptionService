Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

   namespace :api do
    namespace :v0 do
      post "subscriptions", to: "subscriptions#create"
      patch "subscriptions/cancel", to: "subscriptions#cancel"
      get "customers/:id/subscriptions", to: "customers/subscriptions#index"
    end
  end 
end