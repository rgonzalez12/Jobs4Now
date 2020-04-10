class Review < ApplicationController
    has_and_belongs_to_many :users
    has_many :users, through: :jobs

end