class AddActiveColumnToHunts < ActiveRecord::Migration
  def change
    add_column :hunts, :active, :boolean, default: true
  end
end
