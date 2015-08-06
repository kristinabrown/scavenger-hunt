require 'rails_helper'
require 'json'

RSpec.describe HuntsController, type: :controller do

  let(:hunt)        { create(:hunt) }
  let!(:location_1) { create(:location) }
  let!(:location_2) { create(:location_2) }
  let!(:location_3) { create(:location_3) }
  let!(:location_4) { create(:location_4) }

  # let!(:team1)  { create(:team, hunt_id: hunt.id) }
  # let!(:team2)  { create(:team_2, hunt_id: hunt.id) }
  # let!(:team3)  { create(:team_3, hunt_id: hunt.id) }
 
  def create_teams
    3.times do |i|
      Team.create(name: "team #{i}", phone_number: "1303333444#{i}", hunt_id: hunt.id)
    end
  end

  describe "POST#create" do
    it "creates a hunt" do
      params = { name: "1804", number_of_teams: 3 }
      post :create, format: :json, hunt: params

      new_hunt = Hunt.first
      expect(new_hunt.name).to eq("1804")
      expect(new_hunt.number_of_teams).to eq(3)
      expect(new_hunt.active).to eq(true)
    end
  end

  describe "DELETE#destroy" do
    it "ends a hunt" do
      id = hunt.id
      expect(Hunt.first.active).to be(true)
      delete :destroy, format: :json
      expect(Hunt.first.active).to be(false)
    end
  end

  describe "GET#index" do
    xit "returns the data for the current hunt" do
      create_teams
      [0,1,2].each { |n| hunt.teams << Team.all[n] }
      get :index, format: :json
      data = JSON.parse(response.body, symbolize_names: true)
      expect(data[:id]).to eq(3)
      expect(data[:name]).to eq("Turing Scavenger Hunt")
      expect(data[:active]).to be true
      expect(data[:teams].size).to eq(3)
    end
  end

end