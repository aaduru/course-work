class CreateCatRentalRequestTable < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.timestamps
      t.integer :cat_id, null: false
      t.date :start_date ,null: false
      t.date :end_date, null: false
      t.string :status, null:false, defualt: "PENDING"
    end

    add_index :cat_rental_requests, :cat_id, unique: true
  end
end
