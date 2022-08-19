require "test_helper"

class SubscribesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subscribes_index_url
    assert_response :success
  end
end
