class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
 
  
  layout :set_layout

  before_filter :configure_permitted_parameters,if: :devise_controller?
  # before_filter :get_user_followers

	def after_sign_in_path_for(resource)
  	root_path
  end
  def after_sign_out_path_for(resource)
  	root_path
  end
    


  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:address,
	        :email, :password, :password_confirmation])
	    devise_parameter_sanitizer.permit(:account_update,keys: [:name, :profile_picture,:address,
	        :email, :password, :password_confirmation])
  	end

    def set_layout
      unless user_signed_in?
        "home"
      else
       "application"
      end
    end
    
    # def get_user_followers
    #   @followers_count = current_user.followers.uniq.size
    #   @followings_count = current_user.following.uniq.size
    # end


    def record_activity(note, description = nil )
      activity = ActivityLog.new
      activity.user_id = current_user.id if current_user.present?  
      activity.note = note
      activity.description = description
      activity.browser = request.env['HTTP_USER_AGENT']
      activity.ip_address = request.env['REMOTE_ADDR']
      activity.controller = controller_name 
      activity.action = action_name 
      activity.params = params.inspect
      activity.save
    end

end
