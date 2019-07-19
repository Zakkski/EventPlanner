class PlayersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

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
    player.save if event.open
    order_places(event)
    redirect_to event_path(event)
  end

  def update
    @player = Player.find(params[:id])
    interval = params[:interval].to_i
    @player.score += interval
    @player.save
    @score = @player.score
    event = @player.event
    order_places(event)
  end

  private

  def player_params
    params.require(:player).permit(:name, :title, :country_code, :event_id, :score)
  end

  def kabab_case(string)
    string.downcase.split(" ").join("-")
  end

  def order_places(event)
    players = event.players.sort_by { |player| -player.score }
    players.each_with_index do |player, id|
      if id == 0
        player.place = 1
      else
        player.score == players[id - 1].score ? player.place = players[id - 1].place : player.place = id + 1
      end
      player.save
    end
  end
end
