class AccountsController < ApplicationController
  before_action :require_login

  def impersonate
    target_account = Account.find(params[:id])
    if can_impersonate?(target_account)
      session[:account_history] ||= []
      session[:account_history].push(current_user.account_id)
      user_to_impersonate = target_account.users.first      
      session[:user_id] = user_to_impersonate.id
      redirect_to dashboard_path, notice: "You are now viewing as #{target_account.name}"
    else
      redirect_to dashboard_path, alert: "You don't have permission to access this account"
    end
  end

  private

  def can_impersonate?(target_account)
    current_user.account.children.include?(target_account) ||
      session[:account_history]&.include?(target_account.parent_id)
  end
end
