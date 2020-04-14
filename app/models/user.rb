class User < ApplicationRecord
    has_secure_password

    has_many :job_applications
    has_many :jobs
    has_many :reviews
    has_many :event_registrations
    has_many :events
    has_many :follows
    has_many :masteries
    has_many :skills, through: :masteries

end