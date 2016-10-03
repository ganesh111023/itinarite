class AddLatLongToTripActivities < ActiveRecord::Migration
  def change
  	add_column :trip_activities, :lat, :float
  	add_column :trip_activities, :long, :float
  end
end
