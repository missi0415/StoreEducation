class Manager::EducationsController < ApplicationController
  before_action :authenticate_manager!
  def show
    @member = Member.find(params[:id])
    @group = @member.group
    unless @group.manager == current_manager
      redirect_to root_path
    end
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
      flash[:success] = '教育項目の追加が完了しました'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path,flash: { error: @education_new.errors.full_messages })
    end
  end
  
  def update
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
