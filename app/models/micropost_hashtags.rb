class MicropostHashtags < ApplicationRecord
  belongs_to :mannga
  belongs_to :hashtag
  validates  :mannga_id, presence: true
  validates  :hashtag_id,   presence: true
end