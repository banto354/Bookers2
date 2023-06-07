class GroupUsersController < ApplicationController
  def create
    group_user = GroupUser.new(group_id: params[:group_id], user_id: current_user.id)
    group_user.save
    @groups = Group.all
    redirect_to "/groups"
  end

  def destroy
    group_user = GroupUser.find_by(group_id: params[:group_id], user_id: current_user.id)
    group_user.destroy
    @groups = Group.all
    redirect_to "/groups"
  end
  
end
