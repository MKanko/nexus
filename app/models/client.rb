class Client < ApplicationRecord
  belongs_to :contact
  has_many :tasks

  validates :company_name, presence: true
  validates :company_contact, presence: true

  def contact_company_name=(name)
    self.contact = Contact.find_or_create_by(name: name)
  end

  def contact_company_name
      self.contact ? self.contact.name : nil
  end

end
