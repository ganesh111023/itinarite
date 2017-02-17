class TripsController < ApplicationController
  before_action :find_trip, only: [:edit,:update]

  def index
    @trips = current_user.trips.group_by { |c| c.start_date.strftime("%Y") }
  end


  def new
    @trip = current_user.trips.new
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      record_activity("updated trip #{@trip.name.capitalize}.", @trip.description )
      redirect_to trip_path(@trip), notice: "Trip successully updated!"
    else
      render :edit
    end
  end

  def create
    @trip = current_user.trips.new(trip_params)
    if @trip.save
      record_activity("created new trip #{@trip.name.capitalize}.", @trip.description )
      redirect_to trip_path(@trip), notice: "Trip successully created!"
    else
      render :new
    end
  end
  # trips/:id
  def show
    if params[:id] == "create_future_trip"
      redirect_to future_trip_trips_path
    else
      @trip = current_user.trips.find_by_id params[:id]
      @trip_activities_dates = @trip.trip_activities.map{|activity| [activity.activity_date.strftime("%A %b %d %Y"), activity.activity_date.try(:to_date)]}.uniq.reject{ |arr| arr.all?(&:blank?) }
      if request.xhr?
        @trip_activities = @trip.trip_activities.where(activity_date: params[:date])
        @trip_location = @trip.activities_location_from_date(params[:date])
      else
        @trip_location = @trip.trip_locations_as_json
        @trip_activities = @trip.trip_activities
      end
    end
  end

  def my_trip
  end


  def future_trip
    session[:future_trip_params] ||= {}
    @trip = current_user.trips.new(session[:future_trip_params])
    @trip.current_step = session[:future_trip_steps] 
  end
  
  def create_future_trip
    session[:future_trip_params].deep_merge!(params[:trip]) if params[:trip]
    if params[:trip][:address].present?
      session[:location] = []
      address = Geocoder.search(params[:trip][:address])
      lat = address[0].geometry["location"]["lat"]
      lng = address[0].geometry["location"]["lng"]
       session[:location]<< { address: address[0].formatted_address, lat: lat, long: lng }
      @client = GooglePlaces::Client.new("AIzaSyABberdnSWBfbIwim19QNtzQnIuX-yJEww")
      @client.spots(lat,lng, :type=> [:art_gallery,:zoo,:park,:night_club,:museum,:natural_feature]) 
    end

    permited_params = ActionController::Parameters.new(session[:future_trip_params])
    permited_params.permit!

    @trip = current_user.trips.new(permited_params)
    @trip.current_step = session[:future_trip_steps]
    if params[:commit] == "previous_button" 
      @trip.previous_step
    elsif @trip.last_step?
      @trip.save(validate: false)
      flash[:notice] = "future trip created."
    else
      @trip.next_step
    end
    session[:future_trip_steps] = @trip.current_step
    
    if @trip.new_record?
      render 'future_trip'
    else
      session.delete(:location)
      session.delete(:future_trip_steps)
      session.delete(:future_trip_params)
      redirect_to trips_path
    end
   end

  def gallery
    @trip = current_user.trips.find_by_id params[:id]
  end

private
  def trip_params
    params.require(:trip).permit(:name, :description, :address,:start_date,:user_id, :end_date, pictures_attributes: [:id, :name],trip_activities_attributes: [:id, :place, :description,:trip_id,:activity_date, :activity_type])
  end
  def find_trip
    @trip = current_user.trips.find_by_id params[:id]
  end

end
