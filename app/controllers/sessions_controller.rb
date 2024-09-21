class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:account_history] = [] # Initialize impersonation history
      redirect_to dashboard_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    if session[:account_history].present?
      previous_account_id = session[:account_history].pop
      previous_user = User.find_by(account_id: previous_account_id)
      if previous_user
        session[:user_id] = previous_user.id
        redirect_to dashboard_path, notice: "Returned to #{previous_user.account.name}"
      else
        reset_session
        redirect_to login_path, notice: 'Logged out successfully'
      end
    else
      reset_session
      redirect_to login_path, notice: 'Logged out successfully'
    end
  end
end
