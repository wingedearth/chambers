class CreateAccessTypes < ActiveRecord::Migration
  def change
    create_table :access_types do |t|
      t.boolean :curates, default: false
      t.references :user, index: true, foreign_key: true
      t.references :chamber, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
