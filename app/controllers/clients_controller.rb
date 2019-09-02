class ClientsController < ApplicationController

    def index
        @clients = Client.all 
    end 

    def new 
        @client = Client.new 
    end 

    def create 
        @client = Client.new(client_params)
        return redirect_to new_client_path unless @client.save
        redirect_to client_path(@client)
    end
end
