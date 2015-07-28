require 'rails_helper'
require 'rack/test'

RSpec.describe Submission, type: :model do
  context "is valid" do
    it "is valid with valid attributes" do
      submission = Submission.new
      expect(submission).to be_valid
    end
    #this works but I don't want to keep running it...
    xit "can accept a photo" do
      submission = Submission.create
      submission.attachment = Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/sample.jpg', 'image/jpg')
      expect(submission.attachment.url).to eq("http://scavengerhunter.s3.amazonaws.com/submissions/attachments/000/000/002/original/sample.jpg?1438126732")
    end
  end
end
