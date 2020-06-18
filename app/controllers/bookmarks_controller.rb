class BookmarksController < ApplicationController
  def create
  	bookmark = current_user.bookmarks.build(mannga_id: params[:mannga_id])
    bookmark.save!
    redirect_to manngas_path, success: t('.flash.bookmark')
  end

  def destroy
  	current_user.bookmarks.find_by(mannga_id: params[:mannga_id]).destroy!
    redirect_to manngas_path, success: t('.flash.not_bookmark')
  end
end
