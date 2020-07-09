class AddNicknameColumnForUser < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :type, :integer, default: 0
    rename_column :users, :type, :user_type
  end
  def down
    change_column :users, :type, :integer
    rename_column :users, :user_type, :type
  end
end
