class CreateHunt < ActiveRecord::Migration
  def change
    create_table :hunts do |t|
      t.string :name
    end
  end
end
