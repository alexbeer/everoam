class AddUserIdToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :user_id, :integer
    add_index :roams, :user_id
  end
end
