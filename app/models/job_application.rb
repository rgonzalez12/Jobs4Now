class JobApplication < ApplicationRecord
    belongs_to :user
    belongs_to :job
    has_many :applicants, class_name: "User"

end