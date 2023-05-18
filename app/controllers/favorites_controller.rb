class FavoritesController < ApplicationController
    
    def create
        favorite = current_user.favorites.new(book_id: params[:book_id])
        favorite.save
    end
    
    def destroy
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        redirect_to request.referer
    end
    
end
