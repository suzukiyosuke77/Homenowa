require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reports_create_url
    assert_response :success
  end

  test "should get index" do
    get reports_index_url
    assert_response :success
  end

  test "should get destroy" do
    get reports_destroy_url
    assert_response :success
  end
end
