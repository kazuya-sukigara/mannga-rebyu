class GenresController < ApplicationController
	def show
		@genre = Genre.find(params[:id])
		@manngas = @genre.manngas
	end
end
