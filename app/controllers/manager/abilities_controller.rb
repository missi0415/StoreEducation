class Manager::AbilitiesController < ApplicationController
  before_action :authenticate_manager!
  def show
    @member = Member.find(params[:id])
    @group = @member.group
    unless @group.manager == current_manager
      redirect_to root_path
    end
    @members = @group.members
    @ability_titles = @group.ability_titles
    @abilities = @member.abilities
    @ability = Ability.find_by(member_id: params[:id])
    @member_id = @member.id
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
    @ability_new = Ability.new(ability_params)
    @ability_new.save
      redirect_back(fallback_location: root_path)
  end
  
  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      flash[:success] = '教育項目の値が更新されました'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @ability.errors.full_messages })
    end
  end
  
  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy
    redirect_back(fallback_location: root_path)
  end  
    
  private
  
  def ability_params
    params.require(:ability).permit(:member_id,:title,:value)
  end
end
