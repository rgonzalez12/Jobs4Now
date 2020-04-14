class UsersController < ApplicationController
    skip_before_action :verified, only: [:new, :create]
    
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to '/home'
      else
        render :new
      end
    end

    def index
      @job = Job.all
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
    
      if @user.save
        redirect_to @user
      else
        render :edit
      end
    end

    def show 
      @user = User.find_by(id: params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :address, :bio)
    end

end