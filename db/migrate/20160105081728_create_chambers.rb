class CreateChambers < ActiveRecord::Migration
  def change
    create_table :chambers do |t|
      t.string :name
      t.string :description
      t.string :image_uri, default: "http://www.onlinecollege.org/wp-content/uploads/George%20Peabody%20Library.jpg"
      t.string :featured, default: false

      t.timestamps null: false
    end
  end
end
