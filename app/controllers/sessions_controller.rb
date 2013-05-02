require 'digest'

class SessionsController < ApplicationController
  def create
    admin = Admin.find_by_username(params[:username])
    unless admin.blank?
      if Digest::MD5.hexdigest(params[:password] + admin.seed) == admin.password
        session[:password] = admin.password
        flash[:notice] = "Successfully logged in"
        redirect_to home_path
      else
        flash[:notice] = "Login Failed"
        redirect_to login_path
      end
    end        
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to login_path
  end
end
