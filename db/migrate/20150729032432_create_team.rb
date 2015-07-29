class CreateTeam < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.references :hunt, index: true, foreign_key: true
      t.boolean :active, default: true
      t.string :slug
      t.string :phone_number
      t.integer :found_locations, default: 0
    end
  end
end
