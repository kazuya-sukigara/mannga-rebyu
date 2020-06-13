class Mannga < ApplicationRecord
	attachment :image
    belongs_to :genre
	has_many :posts
	has_many :favorites, dependent: :destroy
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end
