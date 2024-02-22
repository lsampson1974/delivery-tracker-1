class DeliveryController < ApplicationController

    def index

      if current_user != nil

          render ({ :template => "delivery/index" })

      else

          redirect_to("/users/sign_in", { :notice => "You need to sign in or sign up before continuing."})

      end # Of condition.

    end # Of method.

end # Of class
