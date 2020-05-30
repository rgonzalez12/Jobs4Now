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
    validates :password, confirmation: { case_sensitive: true }
    validates :email, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, length: { in: 5..15 }
    validates :address, presence: true

    has_many :registrations, foreign_key: "attendee_id", class_name: "EventRegistration"
    has_many :hosts, foreign_key: "host_id", class_name: "EventRegistration"
    has_many :employers, foreign_key: "employer_id", class_name: "JobApplication"
    has_many :applications, foreign_key: "applicant_id", class_name: "JobApplication"
    has_many :jobs_applied, through: :applications, source: :job

    has_many :jobs
    has_many :reviews
    has_many :events
    has_many :masteries
    has_many :skills, through: :masteries

end