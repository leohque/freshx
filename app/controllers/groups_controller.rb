class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to group_path(@group)
  end

  def join
    @group = Group.find(params[:id])
    group_user = GroupUser.new(group_id: @group.id, user_id: current_user.id)
    group_user.save
    redirect_to group_path(@group)
  end

  def leave
    @group = Group.find(params[:id])
    @group_user = GroupUser.find_by(group: @group, user: current_user)
    @group_user.delete
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :location)
  end

end
