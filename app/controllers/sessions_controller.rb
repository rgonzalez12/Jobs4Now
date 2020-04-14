class SessionsController < ApplicationController
    skip_before_action :verified, only: [:new, :create]

    def new
    end

    def create
      user = User.find_by(email: params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        flash[:message] = "Username or Password is incorrect, please try again."
        redirect_to "/login"
      end

    end

    def destroy
      session.delete("user_id")
      redirect_to root_path
    end

end