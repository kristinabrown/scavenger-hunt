class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token
  helper_method :current_admin
  
  def current_admin
    @current_admin = Admin.find(session[:admin_id]) if session[:admin_id]
  end

end
