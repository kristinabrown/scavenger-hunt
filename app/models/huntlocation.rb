class Huntlocation < ActiveRecord::Base
  belongs_to :hunt
  belongs_to :location
end
