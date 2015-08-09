require 'rails_helper'
require 'json'

RSpec.describe TeamsController, type: :controller do


  let!(:location) { create(:location) }
  let!(:location_2) { create(:location_2) }
  let!(:location_3) { create(:location_3) }
  let!(:location_4) { create(:location_4) }
  let!(:location_5) { create(:location_5) }
  let!(:location_6) { create(:location_6) }
  let!(:location_7) { create(:location_7) }
  let!(:location_8) { create(:location_8) }
  let!(:location_9) { create(:location_9) }
  let!(:location_10) { create(:location_10) }
  let!(:location_11) { create(:location_11) }
  let!(:location_12) { create(:location_12) }
  let!(:location_13) { create(:location_13) }
  let!(:location_14) { create(:location_14) }

  let!(:hunt) { create(:hunt) }

  let!(:team1)  { create(:team, hunt_id: hunt.id) }
  let!(:team2)  { create(:team_2, hunt_id: hunt.id) }
  let!(:team3)  { create(:team_3, hunt_id: hunt.id) }

  let!(:submission_1) { create(:submission_1)}
  let!(:submission_2) { create(:submission_2)}
  let!(:submission_3) { create(:submission_3)}
  let!(:submission_4) { create(:submission_4)}

  before(:each) do
    team1.hunt_id = hunt.id
    team2.hunt_id = hunt.id
  end

  describe "POST #create" do
    #skipped because of Twilio
    xit "creates a new team" do
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
    xit "update the team name" do
      non_factory_girl_team = Team.create(name: "team", hunt_id: hunt.id, phone_number: 17777777777)
      expect(non_factory_girl_team.name).to eq("team")

      params = {name: "New Name"}
      patch :update, slug: non_factory_girl_team.slug, format: :json, team: params

      result = Team.find_by!(id: non_factory_girl_team).name

      expect(result).to eq("New Name")
    end

    xit 'updates hunt_initiated' do
      params = {id: team1.id, hunt_initiated: true}
      patch :update, slug: team1.slug, team: params, format: :json
    
      result = Team.find_by!(id: team1.id).hunt_initiated
      expect(result).to be true
    end
  end

  describe "GET #index" do
    it "gets an index of all teams on current hunt" do

      params = {hunt_id: hunt.id}

      get :index, format: :json, team: params

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data.count).to eq(3)
    end
  end

  describe "GET #team_data" do
    it "gets individual team data" do
      team1.location.clues.create!(info: "info")
      get :team_data, format: :json, slug: team1.slug

      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:team_info][:hunt_initiated]).to be false
    end
  end

  describe "PUT #next_location" do
    it "gets the next location" do
      team1.update(location_id: Location.last.id)
      old_location = team1.location_id
      put :next_location, format: :json, slug: team1.slug, team: {correct: true}

      new_location = Team.find(team1.id).location_id
      expect(new_location).to eq(14)
    end

    it "gets the next location" do
      team1.update(location_id: Location.first.id)
      old_location = team1.location_id
      put :next_location, format: :json, slug: team1.slug, team: {correct: true}

      new_location = Team.find(team1.id).location_id
      expect(new_location).to eq(1)
    end

    it "does not set a new location if correct is false" do
      old_location = team1.location_id
      put :next_location, format: :json, slug: team1.slug, team: {correct: false}

      new_location = Team.find(team1.id).location_id
      expect(new_location).to eq(old_location)
    end
  end

end
