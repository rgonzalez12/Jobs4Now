class ReviewsController < ApplicationController

    def new
      @review = Review.new
    end

    def create

    end

    def index

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

    end

end