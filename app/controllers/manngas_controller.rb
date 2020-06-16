class ManngasController < ApplicationController
	def index
  	  @manngas = Mannga.all #一覧表示するためにManngaモデルの情報を全てくださいのall
  	  @genres = Genre.all.order("id ASC")
    end

    def show
  	  @mannga = Mannga.find(params[:id])
      @genres = Genre.find(params[:id])
      @posts = @mannga.posts #その漫画に紐づくレビュー

  end
end
