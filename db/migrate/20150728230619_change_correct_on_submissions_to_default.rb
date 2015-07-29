class ChangeCorrectOnSubmissionsToDefault < ActiveRecord::Migration
  def change
    change_column :submissions, :correct, :boolean, default: false
  end
end
