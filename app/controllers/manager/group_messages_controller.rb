class Manager::GroupMessagesController < ApplicationController
  before_action :authenticate_manager!
  def show
    @group = Group.find(params[:id])
    unless @group.manager == current_manager
    redirect_to root_path
    end
    @group_messages = @group.group_messages.order(created_at: :desc)
    @manager_id = current_manager.id
    @group_message_new = GroupMessage.new
  end
  
  def create
    @group_message_new = GroupMessage.new(group_message_params)
    @group_message_new.score = Language.get_data(group_message_params[:body])  #この行を追加
    if @group_message_new.save
      flash[:success] = '店舗連絡の投稿が完了しました'
       redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @group_message_new.errors.full_messages })
    end
  end
  
  def update
    @group_message = GroupMessage.find(params[:id])
    @group_message.score = Language.get_data(group_message_params[:body]) 
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
