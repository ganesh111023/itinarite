class CreateTripActivities < ActiveRecord::Migration
  def change
    create_table :trip_activities do |t|
      t.string :place
      t.text :description
      t.datetime :activity_date
      t.string :type
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
