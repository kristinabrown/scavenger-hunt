require 'rails_helper'
require 'json'

RSpec.describe SubmissionsController, type: :controller do

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

  let!(:submission_1) { create(:submission_1)}
  let!(:submission_2) { create(:submission_2)}
  let!(:submission_3) { create(:submission_3)}
  let!(:submission_4) { create(:submission_4)}

  before(:each) do
    submission_2.team_id = team.id
    team.submissions << submission_2
  end

  describe "POST#create" do
    #skipped because of redis
    xit "creates a submission" do
      beginning_count = Submission.count
      post :create, format: :json, team_id: team.id, location_id: location.id
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

  describe "PATCH#update" do
    #skipped because of redis
    xit "updates a submission" do
      expect(submission_1.correct).to eq(false)
      params = {submission_id: submission_1.id, correct: true, id: submission_1.id}
      put :update, :id => submission_1.id, format: :json, submission: params
      submission_1 = Submission.find(10)
      expect(submission_1.correct).to eq(true)
    end
  end

  describe "GET#latest_submission" do
    it "gets the teams latest submission when responded to" do
      params = { team_id: team.id }
      get :latest_submission, format: :json, team_id: params
      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:responded_to]).to be(true)
      expect(data[:correct]).to be(true)
    end
  end
end
