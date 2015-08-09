require 'rails_helper'

RSpec.describe :Team, type: :model do

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
  let!(:team) { create(:team, hunt_id: hunt.id) }

  it 'is valid with proper attributes' do
    expect(team).to be_valid
  end

  it 'has a default found locations of 0' do
    expect(team.found_locations).to eq(0)
  end

  it 'has a default hunt_initialized of false' do
    expect(team.hunt_initiated).to be false
  end

  it 'cannot have a team name longer than 30 characters' do
    team.name = 'This name is 31 characters long'
    expect(team).to be_invalid
    team.name = 'This name is 30 characters lon'
    expect(team).to be_valid
  end

  it 'cannot have a team name shorter than 2 characters' do
    team.name = 'T'
    expect(team).to be_invalid
    team.name = 'TO'
    expect(team).to be_valid
  end

  it 'is invalid without a phone number' do
    team.phone_number = nil
    expect(team).to be_invalid
  end

  it 'is invalid with a phone number that does not start with 1' do
    team.phone_number = '05556667777'
    expect(team).to be_invalid
    team.phone_number = '35556667777'
  end

  it 'is invalid unless phone number is made up of numbers' do
    team.phone_number = '1-303-5140+'
    expect(team).to be_invalid
    team.phone_number = '1a303z5140v'
    expect(team).to be_invalid
  end

  it 'is invalid with a phone number that is not 11 numbers long' do
    team.phone_number = '1234567890'
    expect(team).to be_invalid
    team.phone_number = '123456789012'
    expect(team).to be_invalid
    team.phone_number = '12345678901'
    expect(team).to be_valid
  end

  it 'belongs to a single hunt' do
    expect(team.hunt.name).to eq('Turing Scavenger Hunt')
    hunt_2 = Hunt.new(name: 'A different hunt')
    team.hunt = hunt_2
    expect(team.hunt.name).to eq('A different hunt')
    expect(team.hunt.name).to_not eq('Turing Scavenger Hunt')
  end

end
