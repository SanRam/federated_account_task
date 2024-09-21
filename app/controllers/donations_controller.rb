class DonationsController < ApplicationController
  before_action :require_login
  before_action :check_impersonation

  def create
    @donation = current_user.account.donations.new(donation_params)
    if @donation.save
      redirect_to dashboard_path, notice: 'Donation was successfully created.'
    else
      redirect_to dashboard_path, alert: 'Error creating donation.'
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:amount)
  end

  def check_impersonation
    if impersonating?
      redirect_to dashboard_path, alert: 'Impersonated users cannot make donations.'
    end
  end
end
