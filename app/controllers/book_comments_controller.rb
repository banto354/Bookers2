class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @n_book_comment = BookComment.new(book_comment_params)
    @n_book_comment.user_id = current_user.id 
    @n_book_comment.book_id = @book.id
    @n_book_comment.save
    @book_comments = @book.book_comments
  end

  def destroy
    book_comment = BookComment.find(params[:book_id])
    @book = book_comment.book
    book_comment.destroy
    @book_comments = @book.book_comments
    @n_book_comment = BookComment.new
  end
  
  private
  
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
