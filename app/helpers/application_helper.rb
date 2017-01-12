module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def trip_start_date
     @trip.start_date.strftime("%A %b %d %Y")  unless @trip.new_record?
  end

  def trip_end_date
    @trip.end_date.strftime("%A %b %d %Y")  unless @trip.new_record?
  end
  def trip_activity_date trip_activity
    trip_activity.activity_date.strftime("%A %b %d %Y") unless trip_activity.new_record?
  end


  def get_current_page_title
    if params[:controller] == "user_dashboard" && params[:action] == "index"
      "itinarite || News Feed"
    elsif params[:controller] == "user_dashboard" && params[:action] == "followers"
      "itinarite || Followers"
    elsif params[:controller] == "user_dashboard" && params[:action] == "following"
      "itinarite || Following"
    elsif  params[:controller] == "user_dashboard" && params[:action] == "profile"
      "itinarite || Profile"
    elsif  params[:controller] == "registrations" && params[:action] == "edit"
      "itinarite || Setting"
    elsif params[:controller] == "trips" 
      if params[:action] == "new"
        "itinarite || New Trip"
      else 
        "itinarite || Trips"
      end
    elsif params[:controller] == "conversations" && params[:action] == "index"
      "itinarite || conversations"
    else
      "itinarite || " + params[:controller].classify
     end   
  end
end
