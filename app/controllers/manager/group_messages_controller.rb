class Manager::GroupMessagesController < ApplicationController
  def index
    @group = Group.find(params[:id])
    @group_message.group_id = @group.id
    @group_messages = @group.group_messages
  end
end
