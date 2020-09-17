class Contact < ApplicationRecord
    belongs_to :company
    
    validates :name, presence: true

    validates_format_of :home_phone, :cell_phone, :work_phone,
    :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
    :message => "- Phone numbers must be in xxx-xxx-xxxx format.",
    :allow_blank => true

   CONTACT_TYPES = ["Lead", "Associate", "Primary", "At Company", "Employee", "Personal"]

   def self.type 
    CONTACT_TYPES 
   end 
   
end




