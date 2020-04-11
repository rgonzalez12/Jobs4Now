class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified
    helper_method :current_user

    def home
    end

    private

    def verified
      redirect_to '/' unless authenticated
    end
  
    def authenticated
      !!current_user
    end
  
    def current_user
      User.find_by(id: session[:user_id])
    end
    
end