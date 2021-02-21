require 'test_helper'

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  before_action :set_genre_parent, only: [:new, :create, :edit, :update]
	before_action :authenticate_admin!


	def new
		@book = Book.new
	end

	def index
		@books = Book.all
	end


	def show
		@book = Book.find(params[:id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.new(book_params)
      if @book.save
    	 redirect_to admin_books_path
      else
        flash[:error_messages] = @book.errors.full_messages
        render 'new'
      end
 	end

	def update
		@book = Book.find(params[:id])
		@genre = @book.genre
		@book.update(book_params)
		redirect_to admin_book_path(@book)
	end

	def hashtag
	    @user = current_user
	    @tag = Hashtag.find_by(hashname: params[:name])
	    @books = []
	    MicropostHashtags.where(hashtag_id: @tag.id).includes(:book).each do |micropost_hashtag|
	    	@books << micropost_hashtag.book
	    end

    end


    # 親カテゴリーが選択された後に動くアクション
    def genre_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @genre_children = Genre.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
    end

	private
	def book_params
	params.require(:book).permit(:name, :description, :image, :author, :genre_id)
	end

	def set_genre_parent
	  @genre_parent_array = [{ name: "---", id: "---"}]
	  Genre.where(ancestry: nil).each do |parent|
      @genre_parent_array << { name: parent.name, id: parent.id }
      end
	end
end