require 'rails_helper'
require 'json'

RSpec.describe TeamsController, type: :controller do

  let!(:team1)  { create(:team) }
  let!(:team2)  { create(:team_2) }
  let!(:team3)  { create(:team_3) }
  let!(:hunt) { create(:hunt) }
  let!(:location) { create(:location) }
  let!(:submission_1) { create(:submission_1)}
  let!(:submission_2) { create(:submission_2)}
  let!(:submission_3) { create(:submission_3)}
  let!(:submission_4) { create(:submission_4)}

  describe "POST #create" do
    it "creates a new team" do
      beginning_count = Team.count
      params = {phone_number: "12223334445" , hunt_id: hunt.id}
      post :create, format: :json, team: params

      expect(Team.count).to eq(beginning_count + 1)
      expect(Team.last.hunt_id).to eq(hunt.id)
      expect(Team.last.phone_number).to eq("12223334445")
      expect(Team.last.found_locations).to eq(0)
    end
  end

  describe "PATCH #update" do
    it "updates the team name" do
      







end
