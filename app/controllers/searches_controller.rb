class SearchesController < ApplicationController

  def search
    target = params[:target]
    type = params[:type]
    @query = params[:query]
    
    if target == "User"
      if type == "whole"
        @users = User.where("name LIKE ?", "#{@query}")
      elsif type == "part"
        @users = User.where("name LIKE ?", "%#{@query}%")
      end
    elsif target == "Book"
      if type == "whole"
        @books = Book.where("title LIKE ?", "#{@query}")
      elsif target == "part"
        @books = Book.where("title LIKE ?", "%#{@query}%")
      end
    else 
      redirect_to request.referer
    end
    
  end
  
end
