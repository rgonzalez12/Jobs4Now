class Job < ApplicationRecord
    belongs_to :user
    has_many :applications, through: :users
    has_one :review

end