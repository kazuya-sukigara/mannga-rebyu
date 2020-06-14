class Admin::ManngasController < ApplicationController
	before_action :set_genre_parent, only: [:new, :create]

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
		binding.pry
      if @mannga.save
    	 redirect_to admin_manngas_path
      else
        flash[:error_messages] = @mannga.errors.full_messages
        render 'new'
      end
 	end

	def update
		@mannga = Mannga.find(params[:id])
		@genre = @mannga.genre
		@mannga.update(mannga_params)
		redirect_to admin_mannga_path(@mannga)
	end


    # 親カテゴリーが選択された後に動くアクション
    def genre_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @genre_children = Genre.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
    end

	private
	def mannga_params
	params.require(:mannga).permit(:name, :description, :image, :author, :genre_id)
	end

	def set_genre_parent
	  @genre_parent_array = [{ name: "---", id: "---"}]
	  Genre.where(ancestry: nil).each do |parent|
      @genre_parent_array << { name: parent.name, id: parent.id }
      end
	end
end
