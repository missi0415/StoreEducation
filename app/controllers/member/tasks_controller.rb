class Member::TasksController < ApplicationController
    before_action :authenticate_member!
  
  def update
    @member = current_member
    #tasks-------------------
    @tasks = Task.where(member_id: current_member.id)
    @task = Task.find_by(member_id: current_member.id)
    #education---------------
    @educations = Education.where(member_id: current_member.id)
    @education = Education.find_by(member_id: current_member.id)
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to member_members_path
    else
      render "member/members/index"
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_back(fallback_location: root_path)
  end  
    
  private
  
  def task_params
    params.require(:task).permit(:member_id,:title,:body,:start_on,:end_on,:member_body,:member_status,:manager_status,:progress,)
  end
end
