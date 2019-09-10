class Contact < ApplicationRecord
    belongs_to :company
    
    validates :name, presence: true

    validates_format_of :home_phone, :cell_phone, :work_phone,
    :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
    :message => "- Phone numbers must be in xxx-xxx-xxxx format."

    # def primary_contact=(value)
    #     super(value)
    #     if value == "1"
    #         self.company.update(primary_contact_id: self.id)
    #     #binding.pry
    # end
   
end




