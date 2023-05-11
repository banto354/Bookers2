class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @n_book = Book.new
  end

  def edit
    
  end

  def index
    @user = User.find(current_user.id)
    @books = @user.books
    @n_book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path(@book.id)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title,:body)
  end
  
end
