class DeliveryController < ApplicationController

    def index

        if current_user != nil

            @deliveries = DeliveryItem.all

            render ({ :template => "delivery/index" })
        else
            redirect_to("/users/sign_in", { :notice => "You need to sign in or sign up before continuing."})
        end # Of condition.

    end # Of method.

    #---------------------------------------

    def insert_delivery

        new_delivery = DeliveryItem.new

        new_delivery.name = params.fetch("query_description")
        new_delivery.arrival_date = params.fetch("query_supposed_to_arrive_on").to_date
        new_delivery.description = params.fetch("query_details")
        new_delivery.status = "waiting"

        new_delivery.save
    
        render ({ :template => "delivery/index" })

    end # Of method.

    #---------------------------------------



end # Of class
