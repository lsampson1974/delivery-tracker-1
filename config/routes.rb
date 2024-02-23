Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root to: "delivery#index"

  post("/insert_delivery", { :controller => "delivery", :action => "insert_delivery"})



end
