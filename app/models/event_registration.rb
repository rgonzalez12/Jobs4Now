class EventRegistration < ApplicationRecord
    belongs_to :user
    belongs_to :event
    has_many :attendees, class_name: "User"

end