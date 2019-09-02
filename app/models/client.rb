class Client < ApplicationRecord
  belongs_to :contact

  def contact_company_name=(name)
    self.contact = Contact.find_or_create_by(name: name)
  end

  def user_username
      self.contact ? self.contact.name : nil
  end

end
