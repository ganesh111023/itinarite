class ActivityLog < ActiveRecord::Base

	#sope
	scope :following_user_activities, -> (current_user){ where("user_id IN (?)", current_user.following.ids.uniq << current_user.id).order('created_at desc')}

	#Association
	has_many :activity_comments
	belongs_to :user
	

	def get_comment_users
   self.activity_comments.map(&:user).compact.map(&:name).uniq if self.activity_comments.size > 0
  end

end
