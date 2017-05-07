class RemoveColumnFromCats < ActiveRecord::Migration
  def change
    remove_column :cats , :age
    add_timestamps(:cats)
  end
end
