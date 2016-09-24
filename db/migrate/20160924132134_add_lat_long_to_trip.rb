class AddLatLongToTrip < ActiveRecord::Migration
  def change
  	add_column :trips, :lat, :float
  	add_column :trips, :long, :float
  end
end
