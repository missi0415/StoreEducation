class Manager::EducationsController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @group = @member.group
    @members = @group.members
    @educations = @member.educations
    @education = Education.find_by(member_id: params[:id])
    @member_id = @member.id
    @education_new = Education.new
    #chat----------------------------
    rooms = current_manager.rooms
    #自分が入ってるroomの相手のidを格納する
    @member_ids = []
      rooms.each do |r|
        @member_ids << r.member_id
      end
    #-------------------------------
  end
  
  
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
