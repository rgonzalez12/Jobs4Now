class UsersController < ApplicationController
    skip_before_action :verified, only: [:new, :create]
    
    def new
      @user = User.new
    end

    def create
      if (user = User.create(user_params))
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        render 'new'
      end
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