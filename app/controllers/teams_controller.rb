require 'json'

class TeamsController < ApplicationController
  respond_to :json

  def create
    team = Team.create(team_params)
    Messenger.new.send(team.phone_number)
    respond_with team, location: nil
  end

  def update
    team = Team.find_by!(slug: params[:slug])
    respond_with team.update(team_params), location: nil
  end

  def index
    respond_with Team.on_current_hunt(params["team"]["hunt_id"])
  end

  def show
    @team = Team.find_by(slug: params[:id])
  end

  def team_data
    respond_with Team.find_by!(slug: params[:slug]).data, location: nil
  end

  def next_location
    respond_with Team.find_by!(slug: params[:slug]).next_location(team_params[:correct]), location: nil
  end

  private

  def team_params
    params.require(:team).permit(:hunt_id, :location_id, :name, :phone_number, :found_locations, :hunt_initiated, :correct)
  end

end
