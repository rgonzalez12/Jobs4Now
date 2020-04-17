class ReviewsController < ApplicationController

    def new
      @review = Review.new
    end

    def create

    end

    def index
      @review = Review.all
    end

    def update

    end

    def edit

    end

    def show
      @review = Review.find_by(id: params[:id])
    end

    private

    def review_params
      params.require(:reviews).permit(:rating, :review_info, :user_id, :job_id)
    end

end