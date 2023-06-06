class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  
  def show
    @group = Group.find(params[:id])
    @user = User.find(current_user.id)
    @n_book = Book.new
    
  end

  def index
    @user = User.find(current_user.id)
    @n_book = Book.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
    @user = User.find(current_user.id)
    redirect_to groups_path
  end

  def edit
  end
  
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to '/groups'
  end
  private
  
  def group_params
    params.require(:group).permit(:name,:introduction)
  end
  
  def is_matching_login_user
    group = Group.find(params[:id])
    unless group.owner_id == current_user.id
      redirect_to groups_path 
    end
  end
end
