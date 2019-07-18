class PlayersController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @player = Player.new
    @countries = []
    CSV.foreach('./app/assets/data/countries.csv') do |row|
      @countries << row[0]
    end
  end

  def create
    player = Player.new(player_params)
    player.country_code = kabab_case(player.country_code)
    event = Event.find(params[:event_id])
    player.event = event
    player.save! if event.open
    redirect_to event_path(event)
  end

  def update
    @player = Player.find(params[:id])
    interval = params[:interval].to_i
    @player.score += interval
    @player.save
    @score = @player.score
  end

  private

  def player_params
    params.require(:player).permit(:name, :title, :country_code, :event_id, :score)
  end

  def kabab_case(string)
    string.downcase.split(" ").join("-")
  end
end
