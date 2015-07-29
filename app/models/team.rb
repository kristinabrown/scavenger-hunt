class Team < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 30, minimum: 2 }
  validates :slug, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, format: { with: /^[1].*$/,
    message: 'Must start with 1', multiline: true }, length: { is: 11 }

  after_create :set_locations_found

  def set_locations_found
    self.found_locations ||= 0
  end

end