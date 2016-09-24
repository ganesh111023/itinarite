class UserDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :get_all_user_except_current, only: [:profile, :follow_user, :unfollow_user]

  def index
    @following_recent_activities = ActivityLog.following_user_activities(current_user)
  end

  def profile
     @followings_count = current_user.following.size
     @followers_count = current_user.followers.uniq.size
     @recent_trips = current_user.recent_trips
     @trips_locations = current_user.trips_locations
  end

  #upload_picture_dashboard
  def upload_picture
    if current_user && params[:user].present?
      if current_user.update_attributes(profile_picture: params[:user][:profile_pic])
        record_activity("#{current_user.name.capitalize} updated his profile picture.")
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
    @followings_count = current_user.following.size
    @followers_count = current_user.followers.uniq.size
    record_activity("#{current_user.name.capitalize} Follow #{@user.name.capitalize}.")
  end

  def unfollow_user
    @user = User.find_by_id params[:id]
    current_user.unfollow(@user)
    @followings_count = current_user.following.size
    @followers_count = current_user.followers.uniq.size
    record_activity("#{current_user.name.capitalize} UnFollow #{@user.name.capitalize}.")
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
