class GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
		@parents = Genre.where(ancestry: nil)

		if @genre.ancestry == nil #@genreがancestry.nilがチェックする
		   @children = Genre.where(ancestry: @genre.id)#nillの場合@genre.idをancestryに持つgenreをとる
		   @manngas = Mannga.where(genre_id: @children.ids)#そのジャンルを持つmanngasをとる
		else
		   @manngas = @genre.manngas
	    end
	end
end
