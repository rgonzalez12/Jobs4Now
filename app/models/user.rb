class User < ApplicationRecord
    has_secure_password
    
    PASSWORD_REQ = /\A 
    (?=.{8,})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
    (?=.*[[:^alnum:]])
    /x

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, format: PASSWORD_REQ
    validates :password, confirmation: { case_sensitive: true }

    has_many :jobs
    has_many :events
    has_many :registrations, foreign_key: "attendee_id", class_name: "EventRegistration"
    has_many :hosts, foreign_key: "host_id", class_name: "EventRegistration"
    has_many :employers, foreign_key: "employer_id", class_name: "JobApplication"
    has_many :applications, foreign_key: "applicant_id", class_name: "JobApplication"
    has_many :jobs_applied, through: :applications, source: :job
    has_many :events_registered, through: :registrations, source: :event

    def self.create_with_omniauth(auth)
      user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
      user.email = "#{auth['uid']}@#{auth['provider']}.com"
      user.password = SecureRandom.hex(8)
      user.name = auth['info']['name']
    
      if User.exists?(user.id)
        user
      else
        user.save!
        user
      end
    end

end