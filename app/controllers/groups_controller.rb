class GroupsController < ApplicationController
  def index
    #いまログインしているmanagerに紐付いたgroupsという配列を
    @groups = current_manager.groups
    @group = Group.new
    #groupのFkであるmanager_idにそのページにログインしている人のIDを代入しておくという記述
    @group.manager_id = current_manager.id
  end
  
  def create
    @group = Group.new(group_params)
    @group.manager_id = current_manager.id
    if @group.save
      redirect_back(fallback_location: root_path)
    else
      render:index
    end
  end
  def show
    @group = Group.find(params[:id])
    #送られてくるパラメータを指定している
    @members = @group.members
    
  end
  
  def edit
    @group = Group.find(params[:id])
    
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path(@group)
    else
      render :edit
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end  
    
  private
  
  def group_params
    params.require(:group).permit(:manager_id,:name)
  end
end
