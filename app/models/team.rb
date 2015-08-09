require 'json'
require 'ostruct'

class Team < ActiveRecord::Base
  belongs_to :hunt
  has_many :submissions
  belongs_to :location

  validates :name, presence: true, length: { maximum: 30, minimum: 2 }
  validates :slug, presence: true, uniqueness: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, format: { with: /^[1].*$/,
    message: 'Must start with 1', multiline: true }, length: { is: 11 }

  after_create      :set_locations_found
  after_create      :set_route
  before_validation :generate_starting_name
  before_validation :generate_slug

  def to_param
    self.slug
  end

  def set_locations_found
    self.found_locations ||= 0
  end

  def hunt_routes
    { 1 => [1,2,3,4,5,6,7,8,9,10,11,12,13,14],
      2 => [13,12,11,10,9,8,7,6,5,4,3,2,1,14],
      3 => [3,4,5,6,7,8,9,10,11,12,13,1,2,14],
      4 => [11,10,9,8,7,6,5,4,3,2,1,12,13,14],
      5 => [5,6,7,8,9,10,11,12,13,1,2,3,4,14],
      6 => [9,8,7,6,5,4,3,2,1,13,12,11,10,14],
      7 => [7,8,9,10,11,12,13,1,2,3,4,5,6,14]
    }
  end

  def set_route
    taken_routes = Hunt.last.teams.map {|team| team.route}
    team_route = (1..7).to_a.sample
    if taken_routes.include?(team_route)
      set_route
    else
      self.update(route: team_route)
      self.update(location_id: hunt_routes[self.route][0])
    end
  end

  def generate_starting_name
    self.name = "Team#{self.phone_number}"  if self.name.nil?
  end

  def generate_slug
    self.slug = self.phone_number
  end

  def current_location
    self.update(location_id: hunt_routes[self.route][self.found_locations])
  end

  def data
    submission = self.submissions.last || OpenStruct.new(correct: false, responded_to: true, accepted: true)

    { team_info:       { id: id, name: name, hunt_id: hunt_id, slug: slug, phone_number: phone_number, hunt_initiated:  hunt_initiated, hunt_over: hunt_over },
      location_info:   { found_locations: found_locations, location_id: location_id, location: self.location, clue: self.location.clues.first.info },
      submission_info: { correct: submission.correct, responded_to: submission.responded_to, accepted: submission.accepted }
    }.to_json
  end

  def next_location(correct)
    set_next_location if correct == "true"
  end

  def set_next_location
    new_found = self.found_locations + 1
    new_id = hunt_routes[self.route][new_found]
    self.update(location_id: new_id, found_locations: new_found)
    check_to_see_if_the_hunt_is_over
  end

  def check_to_see_if_the_hunt_is_over
    self.update(hunt_over: true) if location_id == 14
  end 

  def self.on_current_hunt(hunt_id)
    self.joins(:hunt).where(hunt_id: hunt_id)
  end
end
