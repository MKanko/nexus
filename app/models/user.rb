class User < ApplicationRecord

    has_secure_password 

    has_many :contacts
    has_many :clients, through: :contacts
    has_many :schedules
    has_many :tasks, through: :schedules

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { in: 6..20 }

    # def self.find_or_create_by_omniauth(auth_hash)
    #     self.where(:email => auth_hash["info"]["email"]).first_or_create do |user|
    #         user.password = SecureRandom.hex
    #     end
    # end

end
