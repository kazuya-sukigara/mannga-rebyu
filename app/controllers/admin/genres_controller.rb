class Admin::GenresController < ApplicationController
	def index
        @genre = Genre.new
        @parents = Genre.all.order("id ASC")
    end
end
