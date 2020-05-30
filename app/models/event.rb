class Event < ApplicationRecord
    belongs_to :user
    has_many :event_registrations

    scope :posting_date, -> { order('created_at desc') }

    validates :event_time, presence: :true
    validates :name, presence: :true
    validates :description, presence: :true
    validates :agenda, presence: :true
    validates :location, presence: :true
    validates :host_name, presence: :true

    def add_registration_to_event(attendee)
      EventRegistration.create(host_id: user.id, attendee_id: attendee.id, event_id: id)
    end

end