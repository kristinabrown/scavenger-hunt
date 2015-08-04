class SessionsController < ApplicationController
  
  def create
    @admin = Admin.find_by(name: params[:session][:name])
    if @admin && @admin.authenticate(params[:session][:password])
      session[:admin_id] = @admin.id
      redirect_to dashboard_path
    else
      flash[:errors] = "Something went terribly wrong."
      redirect_to login_path
    end
  end
  
  def destroy
    session.clear
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
  
end