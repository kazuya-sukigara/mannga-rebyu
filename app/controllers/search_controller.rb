class SearchController < ApplicationController
	def search
	@user_or_mannga = params[:option]
	@how_search = params[:choice]
    if @user_or_mannga == "1"
      @users = User.search(params[:search], @user_or_mannga, @how_search)
    else
      @manngas = Mannga.search(params[:search], @user_or_mannga, @how_search)
    end
    end
end
