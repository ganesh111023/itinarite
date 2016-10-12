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

end
