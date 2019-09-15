class Company < ApplicationRecord
  belongs_to :user
  has_many :contacts
  has_many :tasks
  has_many :schedules, through: :tasks

  accepts_nested_attributes_for :contacts 

  validates :company_name, presence: true
   

  def set_primary_contact_id(contact)
    if contact.primary_contact
      self.primary_contact_id = contact.id
      self.save     
    end 
  end 

  COMPANY_TYPES = ["Lead", "Client", "Supplier", "Subcontractor", "My Company"]

   def self.type 
    COMPANY_TYPES 
   end 

end

