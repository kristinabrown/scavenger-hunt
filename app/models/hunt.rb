class Hunt < ActiveRecord::Base
  has_many :locations, through: :huntlocations
  has_many :teams
  validates :name, presence: true, length: { maximum: 30, minimum: 2}   
end