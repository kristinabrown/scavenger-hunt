class Location < ActiveRecord::Base
  has_many :hunts, through: :huntlocations
end
