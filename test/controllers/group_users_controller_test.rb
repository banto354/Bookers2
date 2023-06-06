require "test_helper"

class GroupUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get group_users_create_url
    assert_response :success
  end

  test "should get destroy" do
    get group_users_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get group_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get group_users_update_url
    assert_response :success
  end
end
