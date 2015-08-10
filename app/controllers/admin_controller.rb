class AdminController < ApplicationController
  before_action :authorize!
  
  def dashboard
  end
end
