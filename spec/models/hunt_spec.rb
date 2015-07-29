require 'rails_helper'

RSpec.describe :Hunt, type: :model do

  let!(:hunt)  { create(:hunt) }
  let(:team)   { create(:team) }
  let(:team_2) { create(:team_2) }
  let(:team_3) { create(:team_3) }

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

end