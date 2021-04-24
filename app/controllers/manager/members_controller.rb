class Manager::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @group = @member.group
    @members = @group.members
    @member_new = Member.new
    @member_id = @member.id
    
    #tasks-------------------
    @tasks = @member.tasks.page(params[:page]).per(5)
    @task = Task.find_by(member_id: params[:id])
    @task_new = Task.new
    #education---------------
    @educations = @member.educations
    @education = Education.find_by(member_id: params[:id])
    @education_new = Education.new
    #-abilty-------------
    @ability_titles = @group.ability_titles
    @abilities = @member.abilities
    @ability = Ability.find_by(member_id: params[:id])
    @ability_new = Ability.new
    
    #chat----------------------------
    rooms = current_manager.rooms
    #自分が入ってるroomの相手のidを格納する
    @member_ids = []
      rooms.each do |r|
        @member_ids << r.member_id
      end
    #-------------------------------
  end
  
  def create
    @member_new = Member.new(member_params)
    @member_new.save
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @member = Member.find(params[:id])
    @group = @member.group
    @members = @group.members
    @member_id = @member.id
    
    #tasks-------------------
    @task = Task.find_by(member_id: params[:id])
    #education---------------
    @education = Education.find_by(member_id: params[:id])
    #-abilty-------------
    @ability = Ability.find_by(member_id: params[:id])
    #chat---------------------------
    rooms = current_manager.rooms
    #自分が入ってるroomの相手のidを格納する
    @member_ids = []
      rooms.each do |r|
        @member_ids << r.member_id
      end
  end
  
  #
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      flash[:success] = 'メンバー情報を更新しました'
      redirect_to manager_member_path(@member)
    else
      redirect_back(fallback_location: root_path,flash: { error: @member.errors.full_messages })
    end
  end  
  
  
  private
  
  def member_params
    params.require(:member).permit(:name,:name_kana,:image,:phone_number,:is_deleted,:group_id)
  end  
end
