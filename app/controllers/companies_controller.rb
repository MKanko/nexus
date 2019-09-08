class CompaniesController < ApplicationController

    def index
        @companies = Company.all 
    end 

    def new
        @company = Company.new(contact_id: params[:contact_id])
        @contact = Contact.find(params[:contact_id])  
    end 

    def create 
        @company = Company.new(company_params)
        return render :new unless @company.save
        redirect_to contact_company_path(@company.contact, @company)
    end

    def show
        @company = Company.find(params[:id])
    end 

    def edit
        @company = Company.find(params[:id]) 
        @contact = Contact.find(params[:contact_id])
    end 

    def update
        @company = Company.find(params[:id])
        @company.update(company_name: params[:company][:company_name], photo: params[:company][:photo], company_address: params[:company][:company_address], company_contact: params[:company][:company_contact], contact_position: params[:company][:contact_position], contact_work_phone: params[:company][:contact_work_phone], contact_cell_phone: params[:company][:contact_cell_phone], contact_email: params[:company][:contact_email], company_notes: params[:company][:company_notes], contact_notes: params[:company][:contact_notes], last_meeting: params[:company][:last_meeting], last_meeting_notes: params[:company][:last_meeting_notes])
        redirect_to contact_company_path(@company.contact, @company)
    end 

    def destroy
        Company.find(params[:id]).destroy
        redirect_to contact_companies_path
    end 

    private

    def company_params
        params.require(:company).permit(:company_name, :contact_id, :photo, :company_address, :company_contact, :contact_position, :contact_work_phone, :contact_cell_phone, :contact_email, :company_notes, :contact_notes, :last_meeting, :last_meeting_notes)
    end 

end
