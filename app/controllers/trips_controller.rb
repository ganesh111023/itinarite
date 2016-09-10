class TripsController < ApplicationController

	def index
	end


	def new
	  @trip = Trip.new
	end

	def create
	  trip = Trip.new(trip_params)
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
	  params.require(:trip).permit(:name, :description, :address,:start_date, :end_date,:user_id, pictures_attributes: [:id, :name])
	end

end
