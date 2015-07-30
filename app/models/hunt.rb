class Hunt < ActiveRecord::Base
  has_many :locations, through: :huntlocations
  has_many :teams
  validates :name, presence: true, length: { maximum: 30, minimum: 2}  
  validates :number_of_teams, presence: true 

  def self.end_game(id)
    Hunt.find(id).update(active: false)
  end

end