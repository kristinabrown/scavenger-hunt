class AddRouteToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :route, :integer
  end
end
