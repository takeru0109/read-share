class GenresController < ApplicationController
    def show
		@genre = Genre.find(params[:id])
		@parents = Genre.where(ancestry: nil)

		if @genre.ancestry == nil #@genreがancestry.nilがチェックする
		   @children = Genre.where(ancestry: @genre.id)#nillの場合@genre.idをancestryに持つgenreをとる
		   @books = Book.where(genre_id: @children.ids)#そのジャンルを持つbooksをとる
		else
		   @books = @genre.books
	    end
	end
end
