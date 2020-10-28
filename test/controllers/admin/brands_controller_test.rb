require 'test_helper'

class Admin::BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_brands_index_url
    assert_response :success
  end

  test "should get update" do
    get admin_brands_update_url
    assert_response :success
  end

end
