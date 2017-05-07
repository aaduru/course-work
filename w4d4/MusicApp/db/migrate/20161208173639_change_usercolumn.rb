class ChangeUsercolumn < ActiveRecord::Migration
  def change
    remove_column :users, :username
    remove_column :users, :session_token
    add_column :users, :email, :string, null: false, unique: true
    add_column :users, :session_token, :string, null: false
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
  end
end
