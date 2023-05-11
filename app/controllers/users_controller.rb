class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @n_book = Book.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @n_book = Book.new
  end
  
end
