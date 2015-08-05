class Hunt < ActiveRecord::Base
  has_many :huntlocations
  has_many :locations, through: :huntlocations
  has_many :teams
  validates :name, presence: true, length: { maximum: 30, minimum: 2}
  validates :number_of_teams, presence: true

  def self.end_game(id)
    Hunt.find(id).update(active: false)
  end

  def self.current_hunt_data
    current_hunt = Hunt.includes(:teams).last
    submission_data = Hunt.last.teams.map {|team| team.submissions.select {|submission| submission.responded_to == false}}.flatten
    { id: current_hunt.id, name: current_hunt.name,
      active: current_hunt.active,
      number_of_teams: current_hunt.number_of_teams,
      teams:  broken_up_team_data(current_hunt.teams),
      submissions: broken_up_data_submission(submission_data) }.to_json
  end
  
  def self.broken_up_data_submission(submissions)
    submissions.map do |s|
      {data: s, 
       location_name: Location.find(s.location_id).name, 
       team_name: Team.find(s.team_id).name,
       attachment_url: Submission.find(s.id).attachment.url }
    end
  end
  
  def self.broken_up_team_data(teams)
    teams.map do |t|
      {team: t, 
       location_name: Location.find(t.location_id).name }
    end
  end

end
