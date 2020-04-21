class User < ApplicationRecord
    has_secure_password
    
    PASSWORD_REQ = /\A 
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
    /x

    validates :password, format: PASSWORD_REQ
    validates :email, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, length: { in: 5..15 }
    validates :address, presence: true
    
    has_many :job_applications
    has_many :jobs
    has_many :reviews
    has_many :event_registrations
    has_many :events
    has_many :masteries
    has_many :skills, through: :masteries

end