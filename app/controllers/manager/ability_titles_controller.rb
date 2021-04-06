class Manager::AbilityTitlesController < ApplicationController
  
  def create
    @ability_title = AbilityTitle.new(ability_title_params) 
    
    #@ability.member_id = @member.id
    if @ability_title.save
      
      @group = @ability_title.group
      #@members_ids = @group.members.pluck(:id)

      #@members_ids.save
      
      # #繰り返す回数は？グループのメンバーの数だけ作成する
      # @group = @ability_title.group#アビリティタイトルの所属するグループ
      # #メンバー数は
      # p "-----------------------------"
      # @members = @group.members#グループメンバー全員
      
      # @members.each do |member|
      # Ability.create!(
      #   member_id: member,
      #           ability_title_id: @ability_title.id,
      #     )
      # end
      redirect_back(fallback_location: root_path)
    else
      render:show
    end
  end

  def edit
    @ability_title= AbilityTitle.find(params[:id])
  end
  
  def update
    @ability_title= AbilityTitle.find(params[:id])
    if @ability_title.update(ability_apdate_params)
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end
  
  def destroy
    @ability_title= AbilityTitle.find(params[:id])
    @ability_title.destroy
    redirect_back(fallback_location: root_path)
  end  
    
  private
  def ability_apdate_params
    params.require(:ability_title).permit(:title,:group_id)
  end
  
  def ability_title_params
    params.permit(:group_id,:title)
  end
end
