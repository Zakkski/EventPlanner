class PlayersController < ApplicationController
  def create
    player = Player.new(player_params)
    event = Event.find(player.event_id)
    player.save! if event.open
    redirect_to event_path(event)
  end

  private

  def player_params
    params.require(:player).permit(:name, :title, :country_code, :event_id)
  end
end
