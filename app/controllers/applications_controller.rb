class ApplicationsController < ApplicationController

    def index
        @jobs_applied = current_user.jobs_applied
    end

end