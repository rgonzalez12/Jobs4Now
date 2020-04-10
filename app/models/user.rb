class User < ApplicationRecord
    has_secure_password

    has_many :jobs
    has_many :reviews, through: :jobs
    has_many :applications, through: :jobs
    has_many :events
    has_many :follows

end