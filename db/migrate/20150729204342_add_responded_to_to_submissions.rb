class AddRespondedToToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :responded_to, :boolean, default: false
  end
end
