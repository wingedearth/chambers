class AddUserIdToChambers < ActiveRecord::Migration
  def change
    add_column :chambers, :user_id, :integer
  end
end
