class UsersController < ApplicationController
  skip_before_action :verified, :only => [:new, :create]
  before_action :edit_own_profile_only, :only => [:edit, :update, :show]
    
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
      @user = User.find_by_id(params[:id]) 
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :address, :bio, :resume, :cover_letter)
    end

    def edit_own_profile_only
      @user = User.find_by_id(params[:id])

      if current_user.id == @user.id
        render :show
      else
        redirect_to user_path(current_user)
      end
    end

end