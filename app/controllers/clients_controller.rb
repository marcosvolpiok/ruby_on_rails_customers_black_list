class ClientsController < ApplicationController
    require 'securerandom'

    def index
        if params[:q].nil?
            puts "is nil"
            @clients = Client.all
        else
            puts "NOT nil"
            @clients = Client.where("phone LIKE ?", "%#{params[:q]}%")

            puts @clients
        end
    end

    def new
        @client = Client.new
    end

    def create
        uid = SecureRandom.hex(10)

        @client = Client.new
        @client.alias = client_params[:alias]
        @client.phone = client_params[:phone]
        @client.city = client_params[:city]
        @client.id = uid
        @client.save!
        redirect_to '/clients'
    end    

    def search
        @client = Client.new
    end

    private
        def client_params
            params.require(:client).permit(:alias, :phone, :city, :q)
        end    
end
