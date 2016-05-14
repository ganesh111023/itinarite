class RegistrationsController < Devise::RegistrationsController


	def update
		if current_user.address != params[:user][:address] && current_user.name != params[:user][:name]
			record_activity("#{current_user.name.capitalize} updated his Name & Address")
		elsif current_user.name != params[:user][:name]
			record_activity("#{current_user.name.capitalize} updated his name.")
		elsif current_user.address != params[:user][:address]
			record_activity("#{current_user.name.capitalize} updated his address.")
		end

		super
	end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end

