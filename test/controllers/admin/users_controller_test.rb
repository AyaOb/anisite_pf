require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_users　index_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users　index_edit_url
    assert_response :success
  end

end
