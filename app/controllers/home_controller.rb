class HomeController < ApplicationController
	def top
	    @manngas = Mannga.find(Favorite.group(:mannga_id).order('count(mannga_id) desc').limit(3).pluck(:mannga_id))
	    render layout:false
	end

	def about
	end
end
