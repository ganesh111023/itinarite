class ActivityLog < ActiveRecord::Base

	#sope
	scope :following_user_activities, -> (current_user){ where("user_id IN (?)", current_user.following.ids.uniq << current_user.id).order('created_at desc')}

	#Association
	#has_many :activity_comments
	has_many :comments, as: :commentable
	belongs_to :user
	

	def get_comment_users
   self.comments.map(&:user).compact.map(&:name).uniq if self.comments.size > 0
  end

end
