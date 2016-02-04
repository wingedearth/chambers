class CreateBooksUsers < ActiveRecord::Migration
  def change
    create_table :books_users do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
