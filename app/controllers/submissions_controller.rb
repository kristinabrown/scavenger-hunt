require 'json'

class SubmissionsController < ApplicationController
  respond_to :json
  
  def create
    respond_with Submission.create(submission_params), location: nil
  end
  
  def index
    respond_with Submission.where(responded_to: false)
  end
  
  private
  
  def submission_params
    params.require(:submission).permit(:team_id, 
                                       :location_id, 
                                       :attachment)
  end
end
