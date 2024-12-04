require "test_helper"

class BasesControllerTest < ActionDispatch::IntegrationTest
  test "should get admin" do
    get bases_admin_url
    assert_response :success
  end
end
