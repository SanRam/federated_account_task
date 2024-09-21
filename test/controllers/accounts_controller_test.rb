require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get impersonate" do
    get accounts_impersonate_url
    assert_response :success
  end
end
