class FavoritesController < ApplicationController

	def create
		mannga = Mannga.find(params[:mannga_id])
        favorite = current_user.favorites.new(mannga_id: mannga.id)
        favorite.save
        redirect_to request.referer, notice: "いいねしました！"
    end

    def destroy
    	mannga = Mannga.find(params[:mannga_id])
        favorite = current_user.favorites.find_by(mannga_id: mannga.id)
        favorite.destroy
        redirect_to request.referer, notice: "いいねを外しました！"
    end

    private
    def redirect
        case params[:redirect_id].to_i
        when 0
         redirect_to manngas_path
        when 1
        redirect_to mannga_path(@mannga)
        end
    end
end
