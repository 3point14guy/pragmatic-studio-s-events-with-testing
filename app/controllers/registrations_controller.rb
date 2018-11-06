class RegistrationsController < ApplicationController
  before_action :set_event

  def index
    @registrations = @event.registrations
  end

  def new
    @registration = @event.registrations.new
    # this is better than @registration = Registration.new because this way every new registration will be bound to an event by the event_id
  end

  def create
    @registration = @event.registrations.new(registration_params)
    if @registration.save
      redirect_to event_registrations_path(@event), notice: "Thank you for registering."
    else
      render :new
    end
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = @event.registrations.update(registration_params)
    if @registration.save
      redirect_to event_registrations_path(@event), notice: "Thank you for registering."
    else
      render :edit
    end
  end

private

  def registration_params
    params.require(:registration).permit(:name, :email, :how_heard)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
