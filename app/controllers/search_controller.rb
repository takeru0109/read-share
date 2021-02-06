class SearchController < ApplicationController
    def search
	@books = Book.search(params[:search])
	@users = User.search(params[:search])
    end

    def Book.search(search)
    	if search
    		Book.where(['name LIKE ? OR author LIKE ? OR description LIKE ?',"%#{search}%","%#{search}%","%#{search}%"])
    	end
    end
     def User.search(search)
    	if search
    		User.where(['first_name LIKE ? OR nick_name LIKE ? OR last_name LIKE ?',"%#{search}%","%#{search}%","%#{search}%"])
        end
     end
end
