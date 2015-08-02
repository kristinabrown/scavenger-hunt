require 'json'

class HuntsController < ApplicationController
  respond_to :json

  def index
    respond_with Hunt.current_hunt_data, location: nil
  end

  def create
    respond_with Hunt.create(hunt_params), location: nil
  end

  def destroy
    respond_with Hunt.end_game(params[:id])
  end

  private

  def hunt_params
    params.require(:hunt).permit(:name, :number_of_teams)
  end

end
