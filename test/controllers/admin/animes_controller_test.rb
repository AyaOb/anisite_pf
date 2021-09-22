require 'test_helper'

class Admin::AnimesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_animes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_animes_edit_url
    assert_response :success
  end

end
