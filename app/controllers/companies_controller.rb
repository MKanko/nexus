class CompaniesController < ApplicationController

    def index
        @company = Company.find_by(id: params[:company_id]) 
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
    end 

    def update
        #binding.pry
        @company = Company.find(params[:id])
        @company.update(company_params)
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
            :company_type, :company_phone, :company_industry,
            :company_email, :company_notes, :company_website, 
            contacts_attributes: [
                :name, :photo, :contact_type, :relationship, :home_phone, 
                :cell_phone, :work_phone, :personal_email, :work_email, :home_address, :work_address, 
                :contact_notes, :primary_contact, :last_meeting_date, :last_meeting_notes
            ]
        )
    end 

end
