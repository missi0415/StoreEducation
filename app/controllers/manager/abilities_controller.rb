class Manager::AbilitiesController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @abilities_titles = Ability.where(member_id: @member.group_id).pluck(:title)
    #binding.pry
    @abilities = @member.abilities
    @ability = Ability.find(params[:id])
    @member_id = @member.id
    @ability_new = Ability.new
  end
  
  
  def create
    @ability_new = Ability.new(ability_params)
    #@ability.member_id = @member.id
    if @ability_new.save
      redirect_back(fallback_location: root_path)
    else
      render:show
    end
  end

  def edit
    @ability = Ability.find(params[:id])
    
  end
  
  def update
    @ability = Ability.find(params[:id])
    if @ability.update(ability_params)
      redirect_back(fallback_location: root_path)
    else
      render :edit
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
