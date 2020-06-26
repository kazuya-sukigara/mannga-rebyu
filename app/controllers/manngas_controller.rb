class ManngasController < ApplicationController

	  def index
  	  @manngas = Mannga.page(params[:page]).reverse_order #一覧表示するためにManngaモデルの情報を全てくださいのall
  	  @parents = Genre.where(ancestry: nil)
    end

    def show
  	  @mannga = Mannga.find(params[:id])
      @posts = @mannga.posts #その漫画に紐づくレビュー
      @parents = Genre.where(ancestry: nil)
      @average_mannga_post = Post.group(:mannga_id).average(:rate)
    end

    def hashtag
	    @user = current_user
      @parents = Genre.where(ancestry: nil)
	    @tag = Hashtag.find_by(hashname: params[:name])
	    @manngas = []
	    MicropostHashtags.where(hashtag_id: @tag.id).includes(:mannga).each do |micropost_hashtag|
	    	@manngas << micropost_hashtag.mannga
	    end
    end

    def bookmarks
    @manngas = current_user.bookmark_boards.includes(:user).recent
    end
end
