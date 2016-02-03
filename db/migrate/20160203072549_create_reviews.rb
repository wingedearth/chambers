class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.boolean :featured, default: false
      t.text :text
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
