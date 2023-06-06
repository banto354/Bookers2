class GroupsController < ApplicationController
  def new
    @gourp = Group.new
  end
  
  def show
  end

  def index
  end

  def create
    @group = Group.new
    @group.owner_id = current_user.id
    redirect_to groups_path
  end

  def edit
  end
end
