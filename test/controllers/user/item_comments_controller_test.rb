require 'test_helper'

class User::ItemCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_item_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_item_comments_destroy_url
    assert_response :success
  end

end
