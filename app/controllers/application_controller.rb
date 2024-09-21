class ApplicationController < ActionController::Base
  helper_method :current_user, :impersonating?

  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to login_path, alert: "You must be logged in to access this page." unless current_user
  end

  def impersonating?
    session[:account_history].present?
  end
end
