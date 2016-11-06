class UserDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :get_all_user_except_current, only: [:profile, :follow_user, :unfollow_user,:follow_unfollow]
  autocomplete :user, :name, :display_value => :name_capitalize,:full => true

  def index
    @recent_activities = ActivityLog.following_user_activities(current_user)    
  end

  def profile
    @posts = Post.self_and_following_user_post(current_user)
    @recent_trips = current_user.recent_trips
    @trips_locations = current_user.trips_locations
  end

  #upload_picture_dashboard
  
  # def upload_picture
  #   if current_user && params[:user].present?
  #     if current_user.update_attributes(profile_picture: params[:user][:profile_pic])
  #       record_activity("#{current_user.name.capitalize} updated his profile picture.")
  #       flash[:notice] = "image successfully uploaded"
  #     else
  #       flash[:alert] = "image upload error"
  #     end
  #   else
  #     flash[:alert] = "Please select image and upload!"
  #   end
  #     redirect_to profile_path
  # end

  def search_user_profile
    @users = User.where("LOWER(name) LIKE ?","%#{params[:search_user].downcase}%") if params[:search_user]
    if @users.present? && @users.count == 1
      redirect_to profile_search_user_dashboard_path(@users.first.id)
    end
  end

  def profile_search
    @user = User.find_by_id params[:id]
    @recent_trips = @user.recent_trips
    @trips_locations = @user.trips_locations
  end

  def follow
    @user = User.find_by_id params[:id]
    current_user.follow(@user)
    record_activity("Follow #{@user.name.capitalize}.")
  end

  def unfollow
    @user = User.find_by_id params[:id]
    current_user.unfollow(@user)
    @followings = current_user.following.uniq
    record_activity("UnFollow #{@user.name.capitalize}.")
  end

  def following
    @user = User.find_by_id params[:id]
    @followings = @user.following.uniq
  end

  def followers
    @user = User.find_by_id params[:id]
    @followers = @user.followers.uniq
  end

  def comment_activity
    @recent_activities = ActivityLog.following_user_activities(current_user)
    activity = @recent_activities.find_by_id params[:id]
    comment = activity.comments.new({description: params[:description]})
    comment.user_id = current_user.id
    comment.save
  end

  private
    def get_all_user_except_current
      @users = User.get_list_of_user_except_current_user(current_user.id)
    end

end
