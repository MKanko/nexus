class Company < ApplicationRecord
  belongs_to :user
  has_many :contacts, :dependent => :destroy
  has_many :tasks, :dependent => :destroy
  has_many :schedules, through: :tasks

  accepts_nested_attributes_for :contacts 

  validates :company_name, presence: true

  def self.by_type(company_type)
    self.where(company_type: company_type) 
  end 

  def set_primary_contact_id(contact)
    if contact.primary_contact
      self.primary_contact_id = contact.id
      self.save     
    end 
  end 

  COMPANY_TYPES = ["Client", "Customer", "Opportunity", "Supplier", "Subcontractor", "Collaborative", "My Company"]

   def self.type 
    COMPANY_TYPES 
   end 

end

