require 'rails_helper'

RSpec.describe :Hunt, type: :model do

  let!(:hunt)  { create(:hunt) }

  let!(:location_1) { create(:location) }
  let!(:location_2) { create(:location_2) }
  let!(:location_3) { create(:location_3) }
  let!(:location_4) { create(:location_4) }
  
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