require 'test_helper'

class Manager::TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get manager_tasks_show_url
    assert_response :success
  end

  test "should get create" do
    get manager_tasks_create_url
    assert_response :success
  end

  test "should get update" do
    get manager_tasks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get manager_tasks_destroy_url
    assert_response :success
  end

end
