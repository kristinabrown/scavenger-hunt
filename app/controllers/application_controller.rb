class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_filter  :verify_authenticity_token
  helper_method :current_admin, :current_admin?

  def current_admin
    @current_admin = Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authorize!
    redirect_to "/" unless current_admin?
  end

  private

  def current_admin?
    if current_admin.nil?
      false
    else
      true
    end
  end
end
