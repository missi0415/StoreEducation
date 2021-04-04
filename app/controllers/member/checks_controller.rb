class Member::ChecksController < ApplicationController
  def create
    group_message = GroupMessage.find(params[:group_message_id])
    check = current_member.checks.new(group_message_id: group_message.id)
    #binding.pry
    check.save
    redirect_back(fallback_location: root_path)
    
  end

  def destroy
    group_message = GroupMessage.find(params[:group_message_id])
    check = current_member.checks.find_by(group_message_id: group_message.id)
    check.destroy
    redirect_back(fallback_location: root_path)
  end
end
