class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
       t.string :name
      t.text :description
      t.string :image_id
      t.string :author
      t.integer :genre_id
      
      t.timestamps
    end
  end
end
