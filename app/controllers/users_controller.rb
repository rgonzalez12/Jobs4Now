class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :edit_own_profile_only, :only => [:edit, :update]
    
    def new
      @user = User.new
    end

    def create
      @user = User.create(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to @user
      else
        render :new
      end
    end

    def edit
    end

    def update
      @user.update(user_params)
    
      if @user.save
        flash[:message] = "Profile Updated Successfully."
        redirect_to @user
      else
        render :edit
      end
    end

    def show
    end

    private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone_number, :address, :bio, :resume, :cover_letter)
    end

    def edit_own_profile_only
      @user = User.find_by(id: params[:id])

      current_user.id == @user.id
      if current_user.id != @user.id
        flash[:error] = "You Can Only Edit Your Own Data."
        redirect_to root_path
      end
    end

end