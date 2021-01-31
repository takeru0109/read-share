class HomeController < ApplicationController
    def top
	    @books = Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(3).pluck(:book_id))
	    render layout:false
    end

	def about
	end
end
