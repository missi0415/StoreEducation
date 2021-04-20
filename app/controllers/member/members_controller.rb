class Member::MembersController < ApplicationController
  before_action :authenticate_member!
  def index
    
    @member = current_member
    #tasks-------------------
    @tasks = Task.where(member_id: current_member.id)
    @task = Task.find_by(member_id: current_member.id)
    #education---------------
    @educations = Education.where(member_id: current_member.id)
    @education = Education.find_by(member_id: current_member.id)
    
        #chat----------------------------
    @group = @member.group #メンバーのグループid
    @manager = @group.manager #グループidに紐付いたマネジャーのid
    rooms = current_member.rooms
    @manager_ids = []
      rooms.each do |r|
        @manager_ids << r.manager_id
      end
    #-------------------------------
  end
  
  def update
    @member = current_member
    #tasks-------------------
    @tasks = Task.where(member_id: current_member.id)
    @task = Task.find_by(member_id: current_member.id)
    #education---------------
    @educations = Education.where(member_id: current_member.id)
    @education = Education.find_by(member_id: current_member.id)
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_members_path
    else
      render :index
    end  
  end  
  
  private
  
  def member_params
    params.require(:member).permit(:name,:name_kana,:email,:image,:phone_number,:is_deleted,:group_id)
  end  
end
