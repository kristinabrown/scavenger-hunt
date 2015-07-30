require 'json'

class TeamsController < ApplicationController
  respond_to :json

  def create
    respond_with Team.create(team_params), location: nil
  end


  private

  def team_params
    params.require(:team).permit(:hunt_id,
                                 :location_id,
                                 :name,
                                 :phone_number,
                                 :found_locations)
  end

end
