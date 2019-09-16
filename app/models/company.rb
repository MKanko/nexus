class Company < ApplicationRecord
  belongs_to :user
  has_many :contacts, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  has_many :schedules, through: :tasks, :dependent => :destroy

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

