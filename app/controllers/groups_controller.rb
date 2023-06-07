class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def new
    @group = Group.new
  end
  
  def show
    @group = Group.find(params[:id])
    @user = User.find(current_user.id)
    @n_book = Book.new
    @group_users = GroupUser.all
  end

  def index
    @n_book = Book.new
    @groups = Group.all
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @user = User.find(current_user.id)
      group_user = GroupUser.new(group_id: @group.id, user_id: current_user.id)
      group_user.save
      redirect_to groups_path
    else 
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "successfully updated!"
      redirect_to '/groups'
    else
      render :edit
    end
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
  
  def ensure_correct_user
    group = Group.find(params[:id])
    if group.owner_id != current_user.id
      render :index
    end
  end
end
