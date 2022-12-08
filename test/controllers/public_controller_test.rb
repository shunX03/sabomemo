require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get userranks" do
    get public_userranks_url
    assert_response :success
  end
end
