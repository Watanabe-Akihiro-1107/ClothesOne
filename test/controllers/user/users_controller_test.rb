require 'test_helper'

class User::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get delete_page" do
    get user_users_delete_page_url
    assert_response :success
  end

  test "should get withdraw" do
    get user_users_withdraw_url
    assert_response :success
  end

end
