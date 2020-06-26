class SearchController < ApplicationController
	def search
	@manngas = Mannga.search(params[:search])
	@users = User.search(params[:search])
    end

    def Mannga.search(search)
    	if search
    		Mannga.where(['name LIKE ? OR author LIKE ? OR description LIKE ?',"%#{search}%","%#{search}%","%#{search}%"])
    	end
    end
     def User.search(search)
    	if search
    		User.where(['first_name LIKE ? OR nick_name LIKE ? OR last_name LIKE ?',"%#{search}%","%#{search}%","%#{search}%"])
    	end
    end
end
