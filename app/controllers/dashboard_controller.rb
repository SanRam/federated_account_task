class DashboardController < ApplicationController
  before_action :require_login

  def show
    @account = current_user.account
    @child_accounts = @account.children.includes(:donations)
    @donation = Donation.new
  end
end
