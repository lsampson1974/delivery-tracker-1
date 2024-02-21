class DeliveryController < ApplicationController

    def index
      puts "TEST"

      render ({ :template => "delivery/index" })

    end

end # Of class
