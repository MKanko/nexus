class ContactsController < ApplicationController

    def index
        if logged_in?
            @contacts = Contact.all 
        else
            redirect_to '/'
        end
    end
    
    def new 
        if logged_in?
            @contact = Contact.new
        else
            redirect_to '/'
        end 
    end 

    def create 
        @contact = Contact.new(contact_params)
        return redirect_to new_contact_path unless @contact.save
        redirect_to contact_path(@contact)
    end 

    def show
        if logged_in?       
            @contact = Contact.find(params[:id])
        else
            redirect_to '/'
        end        
    end 

    def edit
        if logged_in?
            @contact = Contact.find(params[:id])
        else 
            redirect_to '/'
        end 
    end 
    
    def update
        @contact = Contact.find(params[:id])
        @contact.update(name: params[:contact][:name], photo: params[:contact][:photo], contact_type: params[:contact][:contact_type], relationship: params[:contact][:relationship], home_phone: params[:contact][:home_phone], cell_phone: params[:contact][:cell_phone], work_phone: params[:contact][:work_phone], personal_email: params[:contact][:personal_email], work_email: params[:contact][:work_email], home_address: params[:contact][:home_address], work_address: params[:contact][:work_address], contact_notes: params[:contact][:contact_notes])
        redirect_to contact_path(@contact)
    end 

    def destroy
        if logged_in?
            Contact.find(params[:id]).destroy
            redirect_to contacts_path
        else 
            redirect_to '/'
        end 
    end 

    private

    def contact_params
        params.require(:contact).permit(:name, :user_username, :photo, :contact_type, :relationship, :home_phone, :cell_phone, :work_phone, :personal_email, :work_email, :home_address, :work_address, :contact_notes)
    end 

end
