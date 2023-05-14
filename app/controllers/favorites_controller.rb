class FavoritesController < ApplicationController
    
    def create
        favorite = current_user.favorites.new(book_id: params[:book_id])
        favorite.save
        redirect_to books_path
    end
    
    def destroy
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        redirect_to books_path
    end
    
end
