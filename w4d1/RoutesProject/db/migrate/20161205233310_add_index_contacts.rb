class AddIndexContacts < ActiveRecord::Migration
  def change
    add_index :contacts, :name
    add_index :contacts, :email
  end
end
