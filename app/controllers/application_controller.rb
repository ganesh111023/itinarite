class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :set_layout

  before_filter :configure_permitted_parameters,if: :devise_controller?

	def after_sign_in_path_for(resource)
  	root_path
  end
  def after_sign_out_path_for(resource)
  	root_path
  end


  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) do |u|
	      u.permit(:name, :profile_picture,:address,
	        :email, :password, :password_confirmation)
	    end
	    devise_parameter_sanitizer.for(:account_update) do |u|
	     	u.permit(:name, :profile_picture,:address,
	        :email, :password, :password_confirmation)
	    end
  	end
    def set_layout
      unless user_signed_in?
        "home"
      else
       "application"
      end
    end

end
