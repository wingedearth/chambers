class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :book_uri
      t.string :image_uri
      t.integer :chamber_id
      t.boolean :featured

      t.timestamps null: false
    end
  end
end
