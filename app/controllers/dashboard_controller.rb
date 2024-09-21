class DashboardController < ApplicationController
  before_action :require_login

  def show
    @account = current_user.account
    @child_accounts = @account.children.includes(:donations)
    @donation = Donation.new
  end

  private

  def require_login
    redirect_to login_path unless current_user
  end
end
