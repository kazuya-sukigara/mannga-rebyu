class Post < ApplicationRecord
  belongs_to :user
  belongs_to :mannga

  validates :title, presence: true
  validates :body, presence: true
  validates :rate, presence: true
end
