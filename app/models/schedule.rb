class Schedule < ApplicationRecord
  
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  has_many :companies, through: :tasks

  validates :name, presence: true
  validates :schedule_type, presence: true

  SCHEDULE_TYPES = ["Daily", "Weekly", "Monthly"]

  def self.type 
    SCHEDULE_TYPES 
  end 
 
end 