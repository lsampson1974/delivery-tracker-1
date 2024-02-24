Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  #root to: "delivery#index"
  get("/", { :controller => "delivery", :action => "index"})

  get("/delivery/index", { :controller => "delivery", :action => "index"})

  post("/insert_delivery", { :controller => "delivery", :action => "insert_delivery"})

  post("/modify_delivery/:delivery_id", { :controller => "delivery", :action => "update_status"})

  get("/delete_delivery/:delivery_id", { :controller => "delivery", :action => "delete_delivery"})




end
