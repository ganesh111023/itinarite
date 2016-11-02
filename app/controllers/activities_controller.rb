class ActivitiesController < ApplicationController
  before_action :find_trip

  def index
  end

  def new
    @activity = @trip.trip_activities.new
  end

  def create
  end

  def update
  end

  private
    def find_trip
      @trip = current_user.trips.find_by_id params[:trip_id]
    end
end
