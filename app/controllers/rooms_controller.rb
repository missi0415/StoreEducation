class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id]) #ルーム情報の取得
    @group = @room.member.group
    @member = @room.member.id
    @members = @group.members
    @message = Message.new #新規メッセージ投稿
    @messages = @room.messages #このルームのメッセージを全て取得
    #chat----------------------------
    rooms = current_manager.rooms
    #自分が入ってるroomの相手のidを格納する
    @member_ids = []
      rooms.each do |r|
        @member_ids << r.member_id
      end
    #-------------------------------
    
    
    if member_signed_in?
      if @room.member.id == current_member.id
        @manager = @room.manager
      else
        redirect_to "/"
      end
    elsif manager_signed_in?
      if @room.manager.id == current_manager.id
        @member = @room.member
      else
        redirect_to "/"
      end

    else
      redirect_to "/"
    end
  end
  
  def create
    if member_signed_in?
      #memberがログインしてたらmember_idを, managerがログインしてたらmanager_idを@roomにいれる
      @room = Room.new(room_manager_params)
      @room.member_id = current_member.id
    elsif manager_signed_in?
      @room = Room.new(room_member_params)
      @room.manager_id = current_manager.id
    else
      redirect_to "/"
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to "/"
    end
  end
  
  private
  def room_manager_params
    params.require(:room).permit(:manager_id)
  end
  
  def room_member_params
    params.require(:room).permit(:member_id)
  end
  
end
