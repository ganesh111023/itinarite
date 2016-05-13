class UserDashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :get_all_user_except_current, only: [:profile, :follow_user, :unfollow_user]

	def index
	end

	def profile
	   @followings_count = current_user.following.size
	   @followers_count = current_user.followers.uniq.size
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
		current_user.follow(@user)
	end

	def unfollow_user
		@user = User.find_by_id params[:id]
		current_user.unfollow(@user)
	end

	def user_following
		@user = User.find_by_id params[:id]
		@followings = @user.following
	end

	def user_followers
		@user = User.find_by_id params[:id]
		@followers = @user.followers.uniq
	end

	private
		def get_all_user_except_current
			@users = User.get_list_of_user_except_current_user(current_user.id)
		end

end
