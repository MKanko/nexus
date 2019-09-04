class Client < ApplicationRecord
  belongs_to :contact
  has_many :tasks

  validates :company_name, presence: true
  validates :company_contact, presence: true 

end
