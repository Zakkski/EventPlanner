require 'csv'

class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index
    @events = current_user.events || []
  end

  def show
    @event = Event.find(params[:id])
    @players = @event.players
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.user = current_user

    if event.save!
      redirect_to event
    else
      render :new
    end
  end

  def update
    event = Event.find(params[:id])
    event.open = !event.open
    event.save
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render :index
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
