class BooksController < ApplicationController
    def index
  	  @books = Book.page(params[:page]).reverse_order #一覧表示するためにBookモデルの情報を全てくださいのall
  	  @parents = Genre.where(ancestry: nil)
    end

    def show
  	  @book = Book.find(params[:id])
      @posts = @book.posts #その本に紐づくレビュー
      @parents = Genre.where(ancestry: nil)
      @average_book_post = Post.group(:book_id).average(:rate)
    end

    def hashtag
	    @user = current_user
      @parents = Genre.where(ancestry: nil)
	    @tag = Hashtag.find_by(hashname: params[:name])
	    @books = []
	    MicropostHashtags.where(hashtag_id: @tag.id).includes(:book).each do |micropost_hashtag|
	    	@books << micropost_hashtag.book
	    end
    end

    def bookmarks
    @books = current_user.bookmark_boards.includes(:user).recent
    end
end
