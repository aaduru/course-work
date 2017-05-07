class CreateTableCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|

      t.date :birth_date, null: false
      t.integer :age, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.text :sex, null: false, limit: 1
      t.text :description, null: false, limit: 16777216
    end
  end
end
