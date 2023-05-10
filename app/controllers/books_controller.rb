class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def edit
    
  end

  def index
    @books = Book.all
    @book = Book.new
  end
end
