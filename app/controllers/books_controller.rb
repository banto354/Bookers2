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
    @n_book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Successfully posted!"
      redirect_to books_path(@book.id)
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
      flash[:notice] = "Succesfully updated!"
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
  
end
