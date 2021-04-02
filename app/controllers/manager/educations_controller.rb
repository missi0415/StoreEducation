class Manager::EducationsController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @educations = @member.educations
    @education_new = Education.new
  end
  
  
  def create
    @education_new = Education.new(education_params)
    @education.manager_id = current_manager.id
    if @education.save
      redirect_to manager_education_path(education)
    else
      render:show
    end
  end

  def edit
    @education = Education.find(params[:id])
    
  end
  
  def update
    @education = Education.find(params[:id])
    if @education.update(education_params)
      redirect_to manager_education_path(@education)
    else
      render :edit
    end
  end
  
  def destroy
    @education = Education.find(params[:id])
    @education.destroy
    redirect_to manager_educations_path
  end  
    
  private
  
  def education_params
    params.require(:education).permit(:member_id,:title,:body,:progress)
  end

  
end
