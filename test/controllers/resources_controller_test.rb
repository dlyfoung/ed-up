require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get resources_list_url
    assert_response :success
  end

  test "should get add" do
    get resources_add_url
    assert_response :success
  end

  test "should get update" do
    get resources_update_url
    assert_response :success
  end

  test "should get delete" do
    get resources_delete_url
    assert_response :success
  end

end
