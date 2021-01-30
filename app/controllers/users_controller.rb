class UsersController < ApplicationController
	before_action :correct_user, only: [:edit]
	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "編集が完了しました！"
		else
			render 'edit'
		end
	end
	def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
    end

    def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
    end

    def favorite
    @favorite_manngas = current_user.favorite_manngas
    end

    private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :nick_name, :description, :email, :password, :password_confirmation)
	end

	#url直接防止　メソッドを自己定義してbefore_actionで発動。
   def correct_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end
