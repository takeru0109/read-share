class AddColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :name, :string
    add_column :books, :description, :text
    add_column :books, :image_id, :string
    add_column :books, :author, :string
    add_column :books, :genre_id, :integer
  end
end
