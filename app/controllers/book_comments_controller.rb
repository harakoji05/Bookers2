class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    unless @book_comment.save
      @book_comments = BookComment.where(book_id: @book.id)
      @book = Book.find(params[:book_id])
      @book_new = Book.new
      render '/books/show'
    end
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book = @book_comment.book
    if @book_comment.user == current_user
      @book_comment.destroy
    else
      redirect_to request.referer
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
