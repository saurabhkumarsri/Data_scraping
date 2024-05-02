require "test_helper"

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get businesses_index_url
    assert_response :success
  end
end
