class RegistrationsController < Devise::RegistrationsController

	def create
		session[:first_sign_in] = true
		super 
	end


	def update
		if current_user.name != params[:user][:name]
			record_activity("updated his name.")
		elsif current_user.profile_picture.file.try(:filename) !=  params[:user][:profile_picture].try(:original_filename)
			record_activity("updated his profile picture.")
		end
		super
	end

  protected

  def update_resource(resource, params)
  	if params[:password].present? and params[:password_confirmation].present?
  		resource.update_attributes(params)
  	else
  		resource.update_without_password(params)
  	end
    
  end
end

