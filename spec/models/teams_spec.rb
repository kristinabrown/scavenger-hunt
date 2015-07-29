require 'rails_helper'

RSpec.describe :Team, type: :model do

  let!(:hunt) { create(:hunt) }
  let!(:team) { create(:team) }

  before(:each) do 
    team.hunt_id = hunt.id
  end

  it 'is valid with proper attributes' do
    expect(team).to be_valid
  end

  it 'has a default active state of true' do
    expect(team.active).to be true
  end

  it 'has a default found locations of 0' do
    expect(team.found_locations).to eq(0)
  end

  it 'is invalid without a team name' do
    team.name = nil
    expect(team).to be_invalid
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

  it 'is invalid without a slug' do
    team.slug = nil
    expect(team).to be_invalid
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

end