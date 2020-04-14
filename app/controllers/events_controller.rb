class EventsController < ApplicationController

    def new
      @event = Event.new
    end

    def create

    end

    def index

    end

    def edit

    end

    def update

    end

    def show
      @event = Event.find_by(id: params[:id])
    end

    def submit_registration
      if params([:event_id]).present? && params([:user_id]).present?
        EventRegistration.create({:event_id => params[:id], :user_id => event_params[:user_id]})
        flash[:message] = "Successfuly Registered."
      else
        flash[:error] = "Unable to Submit Registration, Please Try Again."
      end
    end

    def destroy
      Event.destroy
    end

    private

    def ensure_own_event
      current_user.id == params[:user_id].to_i && job.user_id == params[:user_id].to_i
    end

    def event_params
      params.require(:events).permit(:user_id, :event_time, :name, :description, :agenda)
    end

end