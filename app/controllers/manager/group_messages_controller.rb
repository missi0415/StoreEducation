class Manager::GroupMessagesController < ApplicationController
  def show
    @group =Group.find(params[:id])
    @group_messages = @group.group_messages
    #@group = current_manager.group_id
    #@group_message.group_id = @group.id
    #@group_messages = @group.group_messages
  end
end
