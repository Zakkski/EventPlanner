class SearchsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:search].present?
      @event = Event.find_by title: params[:search]
      if @event
        redirect_to @event if @event
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end
end
