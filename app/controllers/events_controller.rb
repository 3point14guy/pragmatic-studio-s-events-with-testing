class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:name, :description, :location, :price, :starts_at)
    @event.update(event_params)
    # # don't want to go to an update view template so we redirect
    # redirect_to events_path(@event)
    # # rails has a shortcut for this too
    redirect_to @event
  end
end
