class AddIndexandNotNUll < ActiveRecord::Migration
  def change
    change_column_null(:users, :username, false)
    add_index :users, :username 
  end
end
