class MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @member_new = Member.new
  end
  
  def create
    @member_new = Member.new(member_params)
    @member_new.save
    redirect_back(fallback_location: root_path)
  end
  

  
  private
  
  def manager_params
    params.require(:member).permit(:name,:image,:phone_numbe,:is_deleted,:group_id)
  end  
end
