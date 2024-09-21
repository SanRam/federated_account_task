class AccountsController < ApplicationController
  before_action :require_login

  def impersonate
    account = Account.find(params[:id])
    if account.parent_id == current_user.account_id
      session[:original_user_id] ||= current_user.id
      user = account.users.first
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      redirect_to dashboard_path, alert: "You don't have permission to access this account"
    end
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end
end
