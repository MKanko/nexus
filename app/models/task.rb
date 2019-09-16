class Task < ApplicationRecord

  belongs_to :schedule
  belongs_to :company
  
  validates :name, presence: true
  validates :company, presence: true
  validates :task_type, presence: true

end


