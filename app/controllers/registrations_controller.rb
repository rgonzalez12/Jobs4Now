class RegistrationsController < ApplicationController

    def index
      @events_registered = current_user.events_registered
    end

end