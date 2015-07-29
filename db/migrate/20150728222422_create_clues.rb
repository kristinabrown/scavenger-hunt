class CreateClues < ActiveRecord::Migration
  def change
    create_table :clues do |t|
      t.string :info
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
