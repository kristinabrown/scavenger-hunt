class RemoveActiveColumnFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :active
  end
end
