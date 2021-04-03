class Manager::TasksController < ApplicationController
  def show
    @member = Member.find(params[:id])
    @tasks = @member.tasks
    @task = Task.find(params[:id])
    @member_id = @member.id
    @task_new = Task.new
  end
  
  
  def create
    @task_new = Task.new(task_params)
    #@task.member_id = @member.id
    if @task_new.save
      redirect_back(fallback_location: root_path)
    else
      render:show
    end
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
    params.require(:task).permit(:member_id,:title,:body,:start_on,:end_on,:membar_body,:membar_status,:manager_status,:progress,)
  end
end
