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
    unless @trip.new_record?
      @trip.start_date.strftime("%A %b %d %Y") 
    else
      session[:future_trip_params]["start_date"]
    end
  end

  def trip_end_date
    unless @trip.new_record?
      @trip.end_date.strftime("%A %b %d %Y") 
    else
      session[:future_trip_params]["start_date"]
    end
  end

  def trip_activity_date trip_activity
     unless trip_activity.new_record?
        trip_activity.activity_date.strftime("%A %b %d %Y")
      else
        trip_activity.activity_date.strftime("%A %b %d %Y") if trip_activity.activity_date
     end
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
