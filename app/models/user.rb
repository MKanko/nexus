class User < ApplicationRecord

    has_secure_password 

    has_many :companies, :dependent => :destroy 
    has_many :contacts, through: :companies, :dependent => :destroy
    has_many :schedules, :dependent => :destroy
    has_many :tasks, through: :schedules, :dependent => :destroy

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }, on: :create

    validate :confirm_admin_secret

    def confirm_admin_secret
        if self.admin
            if self.confirm_admin != ENV['ADMIN_SECRET']
                errors.add(:admin, "Admin secret is incorrect.")
            end 
        end    
    end

end


