class Manager::TasksController < ApplicationController
  before_action :authenticate_manager!
  def show
    @member = Member.find(params[:id])
    @tasks = @member.tasks
    @member_id = @member.id
    @group = @member.group
    unless @group.manager == current_manager
      redirect_to root_path
    end
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
    member_id = params[:task][:member_id]
    @tasks = Task.where(member_id: member_id)
    
      if @task_new.save 
        flash[:success] = '課題の追加が完了しました'
      else
        render 'error'
      end 
  end

  def edit
    @task = Task.find(params[:id])
    
  end
  
  def update
    @task = Task.find(params[:id])
    @tasks = Task.where(member_id: @task.member_id)
    if @task.update(task_params)
      flash[:success] = '課題の更新が完了しました'
    else
      render 'error'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @tasks = Task.where(member_id: @task.member_id)
    @task.destroy
  end  
    
  private
  
  def task_params
    params.require(:task).permit(:member_id,:title,:body,:start_on,:end_on,:member_body,:member_status,:manager_status,:progress,)
  end
end
