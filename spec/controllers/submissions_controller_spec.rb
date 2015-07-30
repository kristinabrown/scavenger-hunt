require 'rails_helper'
require 'json'

RSpec.describe SubmissionsController, type: :controller do
  let!(:hunt) { create(:hunt) }
  let!(:team) { create(:team) }
  let!(:location) { create(:location) }
  let!(:submission_1) { create(:submission_1)}
  let!(:submission_2) { create(:submission_2)}
  let!(:submission_3) { create(:submission_3)}
  let!(:submission_4) { create(:submission_4)}

  before(:each) do
    team.hunt_id = hunt.id
  end

  describe "POST#create" do
    it "creates a submission" do
      beginning_count = Submission.count
      params = {team_id: team.id.to_s, location_id: location.id.to_s}
      post :create, format: :json, submission: params

      expect(Submission.count).to eq(beginning_count + 1)
      expect(Submission.last.team_id).to eq(team.id)
      expect(Submission.last.correct).to eq(false)
    end
  end

  describe "GET#index" do
    it "gets the submissions that haven't been responded to" do
      get :index, format: :json
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data.count).to eq(2)
      expect(data.first[:responded_to]).to be(false)
      expect(data.last[:responded_to]).to be(false)
    end
  end
end
