class Location < ActiveRecord::Base
  has_many :teams
  has_many :hunts, through: :huntlocations
  has_many :clues
end
