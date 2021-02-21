class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :body
      t.float :rate
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
