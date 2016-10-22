module UserDashboardHelper
	def get_user_image_url(user_id)
		user = User.find_by_id(user_id)
		user.profile_picture.url
	end

	def get_follow_unfollow_link(user)
		current_user.following.include?(user) ? (link_to "following", "javascript:void(0);", class: "btn btn-success btn-xs") : (link_to "follow", follow_user_dashboard_path(id: user.id) ,method: :post, remote: true, class: "btn btn-success btn-xs") 
	end
end
