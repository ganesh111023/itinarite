class RegistrationsController < Devise::RegistrationsController


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
    resource.update_without_password(params)
  end
end

