class Company < ApplicationRecord
  belongs_to :user
  has_many :contacts
  has_many :tasks
  has_many :schedules, through: :tasks

  accepts_nested_attributes_for :contacts 

  # validates :company_name, presence: true
  # validates :company_contact, presence: true 

end