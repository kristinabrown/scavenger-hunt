class Add < ActiveRecord::Migration
  def change
    add_column :hunts, :number_of_teams, :integer
  end
end
