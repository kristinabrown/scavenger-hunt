require 'json'

class TeamsController < ApplicationController
  respond_to :json

  def create
    respond_with Team.create(team_params), location: nil
  end

  def update
    team = Team.find_by!(id: params[:id])
    respond_with team.update(team_params), location: nil
  end

  def index
    respond_with Team.on_current_hunt(params["team"]["hunt_id"])
  end

  def show
    @team = Team.find_by(slug: params[:id])
  end

  def team_data
    respond_with Team.find_by!(id: params[:id]).data, location: nil
  end

  private

  def team_params
    params.require(:team).permit(:hunt_id, :location_id, :name, :phone_number, :found_locations, :hunt_initiated)
  end

end
