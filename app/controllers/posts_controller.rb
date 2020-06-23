class PostsController < ApplicationController
	def new
		@post = Post.new
		@mannga = Mannga.find(params[:mannga_id])
    end

    def edit
    	@post = Post.find(params[:id])
    end

	def create
		@mannga = Mannga.find(params[:mannga_id])
	    @post = current_user.posts.new(post_params)
	    @post.mannga_id = @mannga.id
	   if @post.save
	    redirect_to mannga_path(@mannga)
	   else

	   	flash[:error_messages] = @post.errors.full_messages
        render 'new'
       end
	end

	def destroy
	    post = Post.find(params[:id])
	    post.destroy
	    redirect_to request.referer
	end

	def update
		@mannga = Mannga.find(params[:mannga_id])
		@post = Post.find(params[:id])
	   if @post.update(post_params)
	    redirect_to mannga_path(@mannga)
	   else
	   	flash[:error_messages] = @post.errors.full_messages
        render 'new'
       end
	end

	private
	def post_params
	params.require(:post).permit(:title,:rate,:body,:mannga_id,:user_id)
	end

end
