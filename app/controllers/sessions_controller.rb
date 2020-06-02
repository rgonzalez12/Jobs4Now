class SessionsController < ApplicationController

  def new
  end

  def create
    if request.env['omniauth.auth']
      flash[:message] = "Complete your profile!"
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id    
      redirect_to edit_user_path(user.id)
    elsif 
      user = User.find_by(email: params[:user][:email])
      user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid Email or Password, Please Try Again."
      redirect_to "/login"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end