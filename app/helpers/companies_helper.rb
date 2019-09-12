module CompaniesHelper

    def display_primary_contact
        if @company.primary_contact_id
            @primary_contact = Contact.find(@company.primary_contact_id)
            "Company Contact: #{link_to @primary_contact.name, company_contact_path(@company, @primary_contact)}"
        end 
    end 

end
