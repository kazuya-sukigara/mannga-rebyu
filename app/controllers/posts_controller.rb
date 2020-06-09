class PostsController < ApplicationController
	def new
		@post = Post.new
		@mannga = Mannga.find(params[:mannga_id])
    end

    def index
        @posts = Post.all
    end

	def create
		mannga = Mannga.find(params[:mannga_id])
	    post = current_user.posts.new(post_params)
	    post.mannga_id = mannga.id
	    post.save
	    redirect_to mannga_path(mannga)
	end

	def destroy
	    mannga = Mannga.find(params[:mannga_id])
	    post = Post.find(params[:id])
	    post.destroy
	    redirect_to request.referer
	end

	private
	def post_params
	params.require(:post).permit(:title,:rate,:body,:mannga_id,:user_id)
	end

end
