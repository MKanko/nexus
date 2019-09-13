class ContactsController < ApplicationController

    def index 
        #binding.pry
        @company = Company.find_by(id: params[:company_id])      
        @contacts = @company.contacts
                 
    end

    def new 
        #binding.pry
        if params[:company_id] && !Company.exists?(params[:company_id])
            redirect_to user_path(current_user), alert: "Company not found."
        else 
            @contact = Contact.new(company_id: params[:company_id])
            @company = Company.find(params[:company_id])
        end         
    end  

    def create        
        @contact = Contact.new(contact_params)
        return render :new unless @contact.save
        redirect_to company_contact_path(@contact.company, @contact)
    end 

    def show       
        @contact = Contact.find(params[:id])       
    end 

    def edit
        if params[:company_id]
            @company = Company.find_by(id: params[:company_id])
            if @company.nil?
                redirect_to user_path(current_user), alert: "Company not found."
            else
                @contact = @company.contacts.find_by(id: params[:id])
                redirect_to user_path(current_user), alert: "Contact not found." if @contact.nil?
            end
        end       
    end 
    
    def update
        @contact = Contact.find(params[:id])
        @contact.update(contact_params)
        redirect_to company_contact_path(@contact.company, @contact)
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
