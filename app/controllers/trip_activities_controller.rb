class TripActivitiesController < ApplicationController

	def update_photo
		activity = TripActivity.find params[:activity_id]
		if activity.update(trip_activity_params)
			flash[:notice] = "photo updated"
		else
			flash[:notice] = "photo update error"
		end
		redirect_to trip_path params[:trip_id]
	end

	private
		def trip_activity_params
			params.require(:trip_activity).permit(pictures_attributes: [:id, :name])
		end

end
