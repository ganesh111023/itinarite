class TripsController < ApplicationController

	def index
		@trips = current_user.trips.group_by { |c| c.created_at.strftime("%Y") }
	end


	def new
	  @trip = current_user.trips.new
	end

	def create
	  trip = current_user.trips.new(trip_params)
	  if trip.save
	  	flash[:notice] = "Trip successully created!"
	  	redirect_to trips_path
	  else
	  	render :new
	  end
	end

	def my_trip
	end

	def gallery
	end



private
	def trip_params
	  params.require(:trip).permit(:name, :description, :address,:start_date, :end_date,:user_id, pictures_attributes: [:id, :name],trip_activities_attributes: [:id, :place, :description,:trip_id,:activity_date, :activity_type, pictures_attributes: [:id, :name]])
	end

end
