class Manager::AbilityTitlesController < ApplicationController
  
  def create
    @ability_title = AbilityTitle.new(ability_title_params) 
    if @ability_title.save
      @group = @ability_title.group
      @members = @group.members
      @members.each do |member|
      Ability.create!(
        member: member,
        ability_title_id: @ability_title.id,
      )
    end
      flash[:success] = '評価項目の追加が完了しました'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @ability_title.errors.full_messages })
    end
  end
  
  def update
    @ability_title= AbilityTitle.find(params[:id])
    if @ability_title.update(ability_apdate_params)
      flash[:success] = '評価項目が更新されました'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @ability_title.errors.full_messages })
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
