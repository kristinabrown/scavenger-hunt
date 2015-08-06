class AddHuntOverBoolToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :hunt_over, :boolean, default: false
  end
end
