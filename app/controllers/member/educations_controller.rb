class Member::EducationsController < ApplicationController
  before_action :authenticate_member!
  
  def update
    @member = current_member
    #tasks-------------------
    @tasks = Task.where(member_id: current_member.id)
    @task = Task.find_by(member_id: current_member.id)
    #education---------------
    @educations = Education.where(member_id: current_member.id)
    @education = Education.find_by(member_id: current_member.id)
    @education = Education.find(params[:id])
    if @education.update(education_params)
      redirect_to member_members_path
    else
      render "member/members/index"
    end
  end
  
  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_back(fallback_location: root_path)
  end  
    
  private
  
  def education_params
    params.require(:education).permit(:member_id,:title,:body,:progress)
  end

end
