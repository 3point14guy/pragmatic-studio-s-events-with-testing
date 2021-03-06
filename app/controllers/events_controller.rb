class EventsController < ApplicationController

  def index
    # @events = Event.all
    @events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
     if @event.update(event_params)
      # # don't want to go to an update view template so we redirect
      # redirect_to events_path(@event)
      # # rails has a shortcut for this too
      # flash[:notice] = "Event successfully updated!"
      # redirect_to @event
      # # OR...
      redirect_to @event, notice: "Event successfully updated"
    else
      render :edit
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      # render the form again with the previously entered submissions
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url
  end

private

  def event_params
    params.require(:event).permit(:name, :description, :location, :price, :starts_at, :image_file_name, :capacity)
  end

end
