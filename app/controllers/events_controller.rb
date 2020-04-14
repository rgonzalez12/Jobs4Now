class EventsController < ApplicationController
  before_action :ensure_own_event, except: [:submit_registration, :show, :index]

    def new
      @event = Event.new
    end

    def create
      @event = current_user.event.build(event_params)
      if @event.save
        redirect_to event_path(@event)
        flash[:message] = "Event Created Successfully."
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
      @event.update(event_params)
    
      if @event.update(event_prarams)
        redirect_to event_path(@event)
        flash[:message] = "Event Updated Successfully."
      else
        flash[:error] = "Unable to Update Event, Please Try Again."
        render :edit
      end
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
      current_user.id == params[:user_id].to_i && event.user_id == params[:user_id].to_i
    end

    def event_params
      params.require(:events).permit(:user_id, :event_time, :name, :description, :agenda)
    end

end