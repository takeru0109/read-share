class Book < ApplicationRecord
    attachment :image
  belongs_to :genre
  has_many :micropost_hashtags, dependent: :destroy
	has_many :posts
  has_many :bookmarks, dependent: :destroy
	has_many :favorites, dependent: :destroy
    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    # boardのお気に入り判定 → views側で呼び出し
    def bookmark_by?(user)
      bookmarks.where(user_id: user.id).exists?
    end


    #DBへのコミット直前に実施する
  after_create do
    book = Book.find_by(id: self.id)
    hashtags  = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      MicropostHashtags.create(book_id: book.id, hashtag_id: tag.id)
    end
  end

  before_update do
    MicropostHashtags.where(book_id: self.id).destroy_all
    hashtags = self.description.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      MicropostHashtags.create(book_id: self.id, hashtag_id: tag.id)
    end
  end
end
