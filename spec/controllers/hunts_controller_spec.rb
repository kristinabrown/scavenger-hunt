require 'rails_helper'
require 'json'

RSpec.describe HuntsController, type: :controller do

  let(:hunt) { create(:hunt) }

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
      delete :destroy, format: :json, id: id
      expect(Hunt.first.active).to be(false)
    end
  end

end