class Member::EducationsController < ApplicationController
  before_action :authenticate_member!
  def create
    @education_new = Education.new(education_params)
    if @education_new.save
      redirect_back(fallback_location: root_path)
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
      redirect_back(fallback_location: root_path)
    else
      render :edit
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