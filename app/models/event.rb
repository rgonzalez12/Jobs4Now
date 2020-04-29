class Event < ApplicationRecord
    belongs_to :user
    has_many :event_registrations

    validates :event_time, presence: :true
    validates :name, presence: :true
    validates :description, presence: :true
    validates :agenda, presence: :true

end