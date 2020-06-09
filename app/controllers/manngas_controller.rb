class ManngasController < ApplicationController
	def index
  	  @manngas = Mannga.all #一覧表示するためにManngaモデルの情報を全てくださいのall
    end

    def show
  	  @mannga = Mannga.find(params[:id])
      @genres = Genre.where(status: true)#ジャンル検索欄に有効になっているものだけ表示
      @posts = @mannga.posts #その漫画に紐づくレビュー
 
  end
end
