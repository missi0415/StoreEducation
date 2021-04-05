class Manager::AbilityTitlesController < ApplicationController
  
  def create
    @ability_title = AbilityTitle.new(ability_title_params)
    #@ability.member_id = @member.id
    if @ability_title.save
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
    if @ability_title.update(ability_title_params)
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
  
  def ability_title_params
    params.permit(:group_id,:title)
  end
end
