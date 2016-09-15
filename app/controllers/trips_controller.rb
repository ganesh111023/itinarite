class TripsController < ApplicationController

	def index
		@trips = current_user.trips.group_by { |c| c.start_date.strftime("%Y") }
	end


	def new
	  @trip = current_user.trips.new
	end

	def create
	  trip = current_user.trips.new(trip_params)
	  if trip.save
	  	redirect_to trips_path, notice: "Trip successully created!"
	  else
	  	render :new
	  end
	end
	# trips/:id
	def show
		@trip = current_user.trips.find_by_id params[:id]
		@trip_activities_dates = @trip.trip_activities.map{|activity| [activity.activity_date.try(:to_date)]}.uniq.reject{ |arr| arr.all?(&:blank?) }
		if request.xhr?
			@trip_activities = @trip.trip_activities.where(activity_date: params[:date])
		else
			@trip_activities = @trip.trip_activities
		end
	end

	def my_trip
	end

	def gallery
		@trip = current_user.trips.find_by_id params[:id]
	end

private
	def trip_params
	  params.require(:trip).permit(:name, :description, :address,:start_date, :end_date,:user_id, pictures_attributes: [:id, :name],trip_activities_attributes: [:id, :place, :description,:trip_id,:activity_date, :activity_type, pictures_attributes: [:id, :name]])
	end

end
