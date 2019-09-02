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

    def show
        @client = Client.find(params[:id])
    end 

    def edit
        @client = Client.find(params[:id]) 
    end 

    def update
        @client = Client.find(params[:id])
        @client.update(company_name: params[:client][:company_name], photo: params[:client][:photo]), company_address: params[:client][:company_address], company_contact: params[:client][:company_contact], contact_position: params[:client][:contact_position], contact_work_phone: params[:client][:contact_work_phone], contact_cell_phone: params[:client][:contact_cell_phone], contact_email: params[:client][:contact_email], company_notes: params[:client][:company_notes], contact_notes: params[:client][:contact_notes], last_meeting: params[:client][:last_meeting], last_meeting_notes: params[:client][:last_meeting_notes])
        redirect_to client_path(@client)
    end 


end
