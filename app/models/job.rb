class Job < ApplicationRecord
    belongs_to :user
    has_many :job_applications
    has_one :review

end