class Mannga < ApplicationRecord
	attachment :image
    belongs_to :genre
	has_many :posts
	has_many :favorites, dependent: :destroy
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end
     def Mannga.search(search, user_or_mannga, how_search)

    if how_search == "1"
       Mannga.where(['title LIKE ?', "%#{search}%"])
       elsif how_search == "2"
       Mannga.where(['title LIKE ?', "%#{search}"])
       elsif how_search == "3"
       Mannga.where(['title LIKE ?', "#{search}%"])
       elsif how_search == "4"
       Mannga.where(['title LIKE ?', "#{search}"])
    else
       Mannga.all

    end
    end

end
