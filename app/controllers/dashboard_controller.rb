class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		
	end

	#upload_picture_dashboard
	def upload_picture
		if current_user && params[:user].present?
			if current_user.update_attributes(profile_picture: params[:user][:profile_pic])
				flash[:notice] = "image successfully uploaded"
			else
				flash[:alert] = "image upload error"
			end
		else
			flash[:alert] = "Please select image and upload!"
		end
			redirect_to dashboard_index_path
	end

end
