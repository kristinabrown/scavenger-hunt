require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  let!(:hunt) { create(:hunt) }
  let!(:team) { create(:team) }
  let!(:location) { create(:location) }
  let(:submission) { Submission.create(team_id: team.id, location_id: location.id) }
  
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
      expect(Submission.last.location_id).to eq(location.id)
    end
  end
end
