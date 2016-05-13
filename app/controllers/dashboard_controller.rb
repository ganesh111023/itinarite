class UserDashboardController < ApplicationController
	before_action :authenticate_user!

	def index
	  
	end

	def profile
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
			redirect_to profile_path
	end

	def follow_user
		@user = User.find_by_id params[:id]
		current_user.follow_user(@user)
	end

	def unfollow_user
		@user = User.find_by_id params[:id]
		current_user.unfollow_user(@user)
	end

end
