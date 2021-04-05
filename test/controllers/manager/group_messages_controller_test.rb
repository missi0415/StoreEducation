require 'test_helper'

class Manager::GroupMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manager_group_messages_index_url
    assert_response :success
  end

end
