class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.boolean :correct
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at

      t.timestamps null: false
    end
  end
end
