class Follow < ApplicationRecord
    belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
    belongs_to :followee, foreign_key: 'followee_id', class_name: 'User'

    validate :follower_and_followee_are_different 

    def follower_and_followee_are_different
        if follower_id == followee_id
          errors.add(:followee_id, "User cannot follow themselves.")
        end
    end

end