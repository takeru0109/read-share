class Hashtag < ApplicationRecord
    validates :hashname, presence: true, length: {maximum:99}
  has_many :micropost_hashtags
end
