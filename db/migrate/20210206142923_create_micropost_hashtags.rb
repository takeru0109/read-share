class CreateMicropostHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :micropost_hashtags do |t|
      t.references :book, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
      t.timestamps
    end
  end
end
