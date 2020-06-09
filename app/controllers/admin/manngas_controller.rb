class Admin::ManngasController < ApplicationController

	def new
		@mannga = Mannga.new
	end

	def index
		@manngas = Mannga.all
	end


	def show
		@mannga = Mannga.find(params[:id])
	end

	def edit
		@mannga = Mannga.find(params[:id])
	end

	def create
		@mannga = Mannga.new(mannga_params)
        @mannga.save
    	redirect_to admin_manngas_path
	end

	def update
		@mannga = Mannga.find(params[:id])
		@genre = @mannga.genre
		@mannga.update(mannga_params)
		redirect_to admin_mannga_path(@mannga)
	end

	private
	def mannga_params
	params.require(:mannga).permit(:name, :description, :image_id, :author, :genre_id)
	end
end
