class Manager::GroupsController < ApplicationController
  before_action :authenticate_manager!
  def index
    @groups = current_manager.groups
    @group = Group.new
    @group.manager_id = current_manager.id
  end
  
  def create
    @groups = current_manager.groups
    @group = Group.new
    @group.manager_id = current_manager.id
    @group = Group.new(group_params)
    @group.manager_id = current_manager.id
    if @group.save
      flash[:success] = '店舗の登録が完了しました'
      redirect_to manager_groups_path
    else
      redirect_back(fallback_location: root_path,flash: { error: @group.errors.full_messages })
    end
  end
  def show
    @group = Group.find(params[:id])
    #送られてくるパラメータを指定している
    @members = @group.members
    @ability_titles = @group.ability_titles
    
  end

  def update
    @groups = current_manager.groups
    @group = Group.new
    @group.manager_id = current_manager.id
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:success] = '店舗情報が更新されました'
      redirect_to manager_groups_path(@group)
    else
      redirect_back(fallback_location: root_path,flash: { error: @group.errors.full_messages })
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to manager_groups_path
  end  
    
  private
  
  def group_params
    params.require(:group).permit(:manager_id,:name,:group_image,:abilitie_title)
  end
end
