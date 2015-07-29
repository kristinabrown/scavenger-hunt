require 'json'

class SubmissionsController < ApplicationController
  respond_to :json
  
  def create
    respond_with Submission.create(submission_params), location: nil
  end
  
  private
  
  def submission_params
    params.require(:submission).permit(:team_id, 
                                       :location_id, 
                                       :attachment)
  end
end
