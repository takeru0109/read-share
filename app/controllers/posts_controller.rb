class PostsController < ApplicationController
    def new
		@post = Post.new
		@book = Book.find(params[:book_id])
    end

    def edit
    	@post = Post.find(params[:id])
    end

	def create
		@book = Book.find(params[:book_id])
	    @post = current_user.posts.new(post_params)
	    @post.book_id = @book.id
	   if @post.save
	    redirect_to book_path(@book), notice: "レビューの投稿が完了しました！"
	   else

	   	flash[:error_messages] = @post.errors.full_messages
        render 'new'
       end
	end

	def destroy
	    post = Post.find(params[:id])
	    post.destroy
	    redirect_to request.referer
	end

	def update
		@book = Book.find(params[:book_id])
		@post = Post.find(params[:id])
	    if @post.update(post_params)
	    redirect_to book_path(@book), notice: "レビューの編集が完了しました！"
	    else
	   	flash[:error_messages] = @post.errors.full_messages
        render 'new'
        end
	end

	private
	def post_params
	    params.require(:post).permit(:title,:rate,:body,:book_id,:user_id)
	end
end
