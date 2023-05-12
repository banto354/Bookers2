class UsersController < ApplicationController
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
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "user profile was updated succesfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email)
  end
  
end
