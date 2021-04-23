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
      flash[:success] = '教育項目の更新が完了しました'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @education.errors.full_messages })
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
