class Skill < ApplicationRecord
    has_many :masteries
    has_many :users, through: :masteries

end