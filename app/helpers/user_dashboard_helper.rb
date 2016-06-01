module UserDashboardHelper
	def get_user_image_url(user_id)
		user = User.find_by_id(user_id)
		user.profile_picture.url
	end
end
