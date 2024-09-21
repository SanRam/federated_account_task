class DonationsController < ApplicationController
  before_action :require_login

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
end
