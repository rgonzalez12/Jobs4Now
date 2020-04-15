class StaticController < ApplicationController
    skip_before_action :verified

    def home
    end

end