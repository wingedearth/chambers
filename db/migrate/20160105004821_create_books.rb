class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :description
      t.string :book_uri
      t.string :image_uri, default: "http://www.thedailyrash.com/wp-content/uploads/2012/08/old_book.jpg"
      t.integer :chamber_id
      t.boolean :featured, default: false
      # t.references :chamber, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
