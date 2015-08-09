require 'rails_helper'

RSpec.describe :Hunt, type: :model do

  let!(:hunt)  { create(:hunt) }

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
  
  let(:team)   { create(:team, hunt_id: hunt.id) }
  let(:team_2) { create(:team_2, hunt_id: hunt.id) }
  let(:team_3) { create(:team_3, hunt_id: hunt.id) }


  it 'is valid with proper attributes' do
    expect(hunt).to be_valid
  end

  it 'is invalid without a name' do
    hunt.name = nil
    expect(hunt).to be_invalid
  end

  it 'cannot have a name longer than 30 characters' do
    hunt.name = 'This name is 31 characters long'
    expect(hunt).to be_invalid
    hunt.name = 'This name is 30 characters lon'
    expect(hunt).to be_valid
  end

  it 'cannot have a name shorter than 2 characters' do
    hunt.name = 'T'
    expect(hunt).to be_invalid
    hunt.name = 'TO'
    expect(hunt).to be_valid
  end

  it 'can have a team assigned' do
    hunt.teams << team
    expect(hunt.teams.count).to eq(1)
  end

  it 'can have multiple teams assigned' do
    teams = [team, team_2, team_3]
    teams.each { |t| hunt.teams << t }
    expect(hunt.teams.count).to eq(3)
  end

  it 'is invalid without a set number of teams' do
    hunt.number_of_teams = nil
    expect(hunt).to be_invalid
    hunt.number_of_teams = 1
    expect(hunt).to be_valid
  end

end