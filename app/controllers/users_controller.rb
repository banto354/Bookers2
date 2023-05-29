class UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @n_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @n_book = Book.new
    # book counter
    today = Date.today
    @books_count = []
    for i in 0..6 do
        @books_count.push(@books.where(created_at: (today - (6-i)).midnight..(today - (6-i)).end_of_day).count)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user profile was updated successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  def post_date
    @user = User.find(params[:user_id])
    @books = @user.books
    @date = Date.parse(params[:date])
    @books_count_date = []
    @books_count_date.push(@books.where(created_at: @date.midnight..@date.end_of_day).count)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id) 
    end
  end
  
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name = 'guestuser'
      redirect_to user_path(current_user), notice: 'ゲストユーザーはプロフィール編集画面に遷移できません。'
    end
  end
  
  
end
