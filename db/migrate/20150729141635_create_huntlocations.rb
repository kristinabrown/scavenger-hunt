class CreateHuntlocations < ActiveRecord::Migration
  def change
    create_table :huntlocations do |t|
      t.references :hunt, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
