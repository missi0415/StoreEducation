require 'test_helper'

class Member::GroupMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_group_messages_show_url
    assert_response :success
  end

end
