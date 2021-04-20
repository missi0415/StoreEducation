class Manager::TasksController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @tasks = @member.tasks
    @member_id = @member.id
    @group = @member.group
    @members = @group.members
    @task = Task.find_by(member_id: params[:id])
    @task_new = Task.new
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
    @task_new = Task.new(task_params)
    @task_new.save
      redirect_back(fallback_location: root_path)

  end

  def edit
    @task = Task.find(params[:id])
    
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_back(fallback_location: root_path)
    else
      render :edit
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
