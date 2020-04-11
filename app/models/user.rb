class User < ApplicationRecord
    has_secure_password

    has_many :job_applications
    has_many :jobs, through: :job_applications
    has_many :reviews
    has_many :event_registrations
    has_many :events, through: :event_registrations
    has_many :follows
    has_many :created_jobs, foreign_key: :user_id

end