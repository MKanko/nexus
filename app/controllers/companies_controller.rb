class CompaniesController < ApplicationController

    def index
        @companies = Company.all 
    end 

    def new
        #binding.pry
        @company = Company.new
        @company.contacts.build               
    end

    def create
        #binding.pry 
        @company = Company.new(company_params)
        return render :new unless @company.save
        @company.set_primary_contact_id(@company.contacts.last) 
        redirect_to company_path(@company)
    end                                        

    def show
        @company = Company.find(params[:id])
    end 

    def edit
        @company = Company.find(params[:id]) 
        #@contact = Contact.find(params[:contact_id])
    end 

    def update
        #binding.pry
        @company = Company.find(params[:id])
        @company.update(company_params)
        #@company.update(company_name: params[:company][:company_name], company_address: params[:company][:company_address], company_contact: params[:company][:company_contact], contact_position: params[:company][:contact_position], contact_work_phone: params[:company][:contact_work_phone], contact_cell_phone: params[:company][:contact_cell_phone], contact_email: params[:company][:contact_email], company_notes: params[:company][:company_notes], contact_notes: params[:company][:contact_notes], last_meeting: params[:company][:last_meeting], last_meeting_notes: params[:company][:last_meeting_notes])
        redirect_to company_path(@company)
    end 

    def destroy
        Company.find(params[:id]).destroy
        redirect_to user_path(current_user)
    end 

    private

    def company_params
        params.require(:company).permit(
            :company_name, :user_id, :photo, :company_address,
            :company_contact, :contact_position, :contact_work_phone, :contact_cell_phone,
            :contact_email, :company_notes, :contact_notes, 
            contacts_attributes: [
                :name, :photo, :contact_type, :relationship, :home_phone, 
                :cell_phone, :work_phone, :personal_email, :work_email, :home_address, :work_address, 
                :contact_notes, :primary_contact, :last_meeting_date, :last_meeting_notes
            ]
        )
    end 

end
