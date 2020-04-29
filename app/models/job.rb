class Job < ApplicationRecord
    belongs_to :user
    has_many :job_applications
    has_one :review

   
    validates :description, presence: :true
    validates :requirements, presence: :true
    validates :compensation, presence: :true
    validates :duration, presence: :true
    validates :schedule, presence: :true
    validates :field_of_work, presence: :true
    validates :contact_info, presence: :true

end