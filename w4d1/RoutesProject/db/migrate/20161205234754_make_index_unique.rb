class MakeIndexUnique < ActiveRecord::Migration
  def change
    remove_index :contacts, :email
    remove_index :contacts, :name
    remove_index :users, :username

    add_index :contacts, :email, :unique => true

    add_index :users, :username, :unique => true

    add_index :contact_shares, [:contact_id,:user_id], :unique => true

    add_index :contact_shares, :contact_id
    add_index :contact_shares, :user_id
    
  end
end
