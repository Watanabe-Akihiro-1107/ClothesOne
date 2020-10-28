require 'test_helper'

class User::BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_brands_index_url
    assert_response :success
  end

  test "should get create" do
    get user_brands_create_url
    assert_response :success
  end

end
