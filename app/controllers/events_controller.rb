class EventsController < ApplicationController
  before_action :ensure_own_event, except: [:submit_registration, :show, :index]
  before_action :edit_own_events_only, only: [:edit, :update, :destroy]

    def new
      @event = Event.new
    end

    def create
      @event = current_user.events.build(event_params)
      if @event.save
        flash[:message] = "Event Created Successfully."
        redirect_to event_path(@event)
      else
        flash[:error] = "Unable to Post Event, Please Try Again."
        render :new
      end
    end

    def index
      @event = Event.all
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
    
      if @event.update(event_params)
        flash[:message] = "Event Updated Successfully."
        redirect_to event_path(@event)
      else
        flash[:error] = "Unable to Update Event, Please Try Again."
        render :edit
      end
    end

    def show
      @event = Event.find_by(id: params[:id])
    end

    def submit_registration
      if params([:event_id]).present? && EventRegistration.create({:event_id => params[:event_id], :user_id => current_user.id})
        flash[:message] = "Successfuly Registered."
      else
        flash[:error] = "Unable to Submit Registration, Please Try Again."
        redirect_to event_path(params[:event_id])
      end
    end

    def destroy
      @event = Event.find_by(id: params[:id])

      if @event.destroy
        flash[:message] = "Event Deleted Successfully."
        redirect_to user_path(current_user)
      else
        flash[:error] = "Unable to Delete Event, Please Try Again."
        render :edit
      end
    end

    private

    def ensure_own_event
      current_user.id == params[:user_id].to_i && event.user_id == params[:user_id].to_i
    end

    def event_params
      params.require(:event).permit(:user_id, :event_time, :name, :description, :agenda)
    end

    def edit_own_events_only
      @event = Event.find_by(id: params[:id])
      current_user.id == @event.user_id
      if current_user.id != @event.user_id
        flash[:error] = "You Can Only Edit Your Own Events."
        redirect_to root_path
      end
    end

end