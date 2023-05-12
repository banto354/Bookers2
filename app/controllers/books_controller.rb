class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @n_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
    @books = Book.all
    @book = Book.new
    @n_book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully posted!"
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      @n_book = Book.new
      render :index
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully updated!"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end 
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  def is_matching_login_user
    book = Book.find(params[:id])
    user = book.user
    unless user.id == current_user.id
      redirect_to books_path 
    end
  end
  
end
