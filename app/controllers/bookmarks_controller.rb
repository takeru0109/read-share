class BookmarksController < ApplicationController
    def create
  	bookmark = current_user.bookmarks.build(book_id: params[:book_id])
    bookmark.save!
    redirect_to books_path, success: t('.flash.bookmark')
    end

  def destroy
  	current_user.bookmarks.find_by(book_id: params[:book_id]).destroy!
    redirect_to books_path, success: t('.flash.not_bookmark')
  end
end
