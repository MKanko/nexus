class User < ApplicationRecord
    has_secure_password 
    has_many :contacts
    has_many :clients, through: :contacts
    has_many :schedules
    has_many :tasks, through: :schedules   
end
