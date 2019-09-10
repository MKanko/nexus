class ContactsController < ApplicationController

    def index      
        @contacts = Contact.all
        # find company that these contacts are associated with         
    end

    def new 
        #binding.pry
        @contact = Contact.new(company_id: params[:company_id])
        @company = Company.find(params[:company_id])
        
    end  

    def create        
        @contact = Contact.new(contact_params)
        return render :new unless @contact.save
        redirect_to contact_path(@contact)
    end 

    def show       
        @contact = Contact.find(params[:id])       
    end 

    def edit
        #binding.pry
        @contact = Contact.find(params[:id])
        @company = Company.find(params[:company_id])
    end 
    
    def update
        @contact = Contact.find(params[:id])
        @contact.update(contact_params)
        #@contact.update(name: params[:contact][:name], photo: params[:contact][:photo], contact_type: params[:contact][:contact_type], relationship: params[:contact][:relationship], home_phone: params[:contact][:home_phone], cell_phone: params[:contact][:cell_phone], work_phone: params[:contact][:work_phone], personal_email: params[:contact][:personal_email], work_email: params[:contact][:work_email], home_address: params[:contact][:home_address], work_address: params[:contact][:work_address], contact_notes: params[:contact][:contact_notes])
        redirect_to contact_path(@contact)
    end 

    def destroy
        Contact.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end 

    private

    def contact_params
        params.require(:contact).permit(:name, :company_id, :photo, :contact_type, :relationship, :home_phone, :cell_phone, :work_phone, :personal_email, :work_email, :home_address, :work_address, :contact_notes, :last_meeting_date, :last_meeting_notes)
    end 

end
