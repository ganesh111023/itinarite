class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.string :address
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
