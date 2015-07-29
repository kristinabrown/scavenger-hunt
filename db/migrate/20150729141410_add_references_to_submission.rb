class AddReferencesToSubmission < ActiveRecord::Migration
  def change
    add_reference :submissions, :team, index: true, foreign_key: true
    add_reference :submissions, :location, index: true, foreign_key: true
  end
end
