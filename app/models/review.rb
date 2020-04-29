class Review < ApplicationController
   belongs_to :job
   belongs_to :user

   validates :rating, presence: :true
   validates :review_info, presence: :true

end