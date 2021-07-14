class BookCommentsController < ApplicationController

  def create
    @books = Book.find(params[:book_id])
    
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.user_id = current_user.id
    
    @book_comment.book_id = @books.id
    @book_comment.save
    render :index

  end

  def destroy
    @books = Book.find(params[:book_id])
    @book_comment = BookComment.new
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    render :index
  end

private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
