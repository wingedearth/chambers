class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :handle
      t.string :city
      t.string :state
      t.string :description
      t.string :image_uri, default: "default-profile-img.jpg"
      t.integer :current_chamber_id
      t.integer :current_book_id
      t.boolean :featured, default: false

      t.timestamps null: false
    end
  end
end
