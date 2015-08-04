require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "is not valid without a name" do
    admin = Admin.create(name: nil, phone: '555-555-5555')

    expect(admin).to_not be_valid
  end

  it "is not valid without a phone" do
    admin = Admin.create(name: "Nerd Herder", phone: nil)

    expect(admin).to_not be_valid
  end

  it "is not valid with a phone as an integer value" do
    admin = Admin.create(name: "Nerd Herder", phone: 5555555555)

    expect(admin).to_not be_valid
  end

  it "is not valid with a phone number not in proper format" do
    admin1 = Admin.create(name: "Sad", phone: '555-5555555')
    admin2 = Admin.create(name: "Also Sad", phone: '5555555555')
    admin3 = Admin.create(name: "Happy", phone: '555-555-5555', password: "password")

    expect(admin1).to_not be_valid
    expect(admin2).to_not be_valid
    expect(admin3).to be_valid
  end

  it "is a valid admin if both phone and name are present and properly formatted" do
    admin = Admin.create(name: 'proper name', phone: '555-555-5555', password: "password")

    expect(admin).to be_valid
  end
end
