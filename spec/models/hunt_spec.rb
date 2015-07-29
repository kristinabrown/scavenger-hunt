require 'rails_helper'

RSpec.describe :Hunt, type: :model do

  let!(:hunt) { create(:hunt) }

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

end