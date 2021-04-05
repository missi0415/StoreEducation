class Manager::MembersController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @group = @member.group
    @members = @group.members
    @member_new = Member.new
  end
  
  def create
    @member_new = Member.new(member_params)
    @member_new.save
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to manager_member_path(@member)
    else
      render :edit
    end  
  end  
  
  
  private
  
  def member_params
    params.require(:member).permit(:name,:name_kana,:image,:phone_number,:is_deleted,:group_id)
  end  
end
