class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :mannga
  validates :user_id, uniqueness: { scope: :mannga_id }
end
