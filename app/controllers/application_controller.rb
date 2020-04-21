class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified
    helper_method :current_user, :logged_in?

    def home
    end

    private

    def verified
      redirect_to '/' unless logged_in?
    end
  
    def logged_in?
      !!current_user
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end
    
end