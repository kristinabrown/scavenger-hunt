class AddHuntInitiatedToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :hunt_initiated, :boolean, default: false
  end
end
