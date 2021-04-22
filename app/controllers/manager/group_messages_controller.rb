class Manager::GroupMessagesController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @group_messages = @group.group_messages
    @manager_id = current_manager.id
    @group_message_new = GroupMessage.new
  end
  
  def create
    @group_message_new = GroupMessage.new(group_message_params)
    if @group_message_new.save
      flash[:success] = '店舗連絡の投稿が完了しました'
       redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @group_message_new.errors.full_messages })
    end
  end
  
  def update
    @group_message = GroupMessage.find(params[:id])
    if @group_message.update(group_message_params)
      flash[:success] = '店舗連絡の更新が完了しました'
       redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @group_message.errors.full_messages })
    end
  end
  
  def destroy
    @group_message = GroupMessage.find(params[:id])
    @group_message.destroy
    redirect_back(fallback_location: root_path)
  end
  
    private
  
  def group_message_params
  params.require(:group_message).permit(:group_id,:manager_id,:title,:body)
  end
end
