class JobApplication < ApplicationRecord
    belongs_to :employer, class_name: "User"
    belongs_to :applicant, class_name: "User"
    belongs_to :job

end