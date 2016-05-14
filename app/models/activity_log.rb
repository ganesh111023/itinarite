class ActivityLog < ActiveRecord::Base

	#sope
	scope :following_user_activities, -> (current_user){ where("user_id IN (?)", current_user.following.ids).order('created_at asc')}
end
