class Member::GroupMessagesController < ApplicationController
  before_action :authenticate_member!
  def index
    @group_messages = current_member.group.group_messages
    @group_message_new = GroupMessage.new
    @member = current_member
    @group = @member.group #メンバーのグループid
    @manager = @group.manager #グループidに紐付いたマネジャーのid
    rooms = current_member.rooms
    @manager_ids = []
      rooms.each do |r|
        @manager_ids << r.manager_id
      end
  end
  
  def create
    @group_messages = current_member.group.group_messages
    @group_message_new = GroupMessage.new(group_message_params)
    if @group_message_new.save
      redirect_back(fallback_location: root_path)
    else
      render:index
    end
  end
  
  def update
    @group_message = GroupMessage.find(params[:id])
    if @group_message.update(group_message_params)
      redirect_back(fallback_location: root_path)
    else
      render :index
    end
  end
  
  def destroy
    @group_message = GroupMessage.find(params[:id])
    @group_message.destroy
    redirect_back(fallback_location: root_path)
  end
  
    private
  
  def group_message_params
  params.require(:group_message).permit(:group_id,:member_id,:title,:body)
  end
end
