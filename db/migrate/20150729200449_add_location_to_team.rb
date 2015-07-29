class AddLocationToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :location, index: true, foreign_key: true
  end
end
