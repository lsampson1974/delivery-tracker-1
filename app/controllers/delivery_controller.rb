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

        if new_delivery.name == "" && new_delivery.arrival_date.nil?
            message = "Description can't be blank and Supposed to arrive on can't be blank" 

        elsif new_delivery.name == ""
            message = "Description can't be blank"

        elsif new_delivery.arrival_date.nil?
            message = "Supposed to arrive on can't be blank"

        else     
            new_delivery.save
            message = "Added to list"
        end # Of condition block

        puts "TEST -->>>> #{new_delivery.arrival_date.nil?}" 


        redirect_to("/", { :notice => "#{message}" })
         
    end # Of method.

    #---------------------------------------

    def update_status

        delivery_id = params.fetch("delivery_id")

        delivery_to_update = DeliveryItem.where({ :id => delivery_id }).first

        delivery_to_update.status = "received"

        delivery_to_update.save

        @deliveries = DeliveryItem.all

        render ({ :template => "delivery/index" })

    end

    #---------------------------------------

    def delete_delivery

        delivery_id = params.fetch("delivery_id")

        delivery_to_delete = DeliveryItem.where({ :id => delivery_id }).first

        delivery_to_delete.destroy

        @deliveries = DeliveryItem.all

        render ({ :template => "delivery/index" })

    end


end # Of class
