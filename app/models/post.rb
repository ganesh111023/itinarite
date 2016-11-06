class Post < ActiveRecord::Base

	#sope
	scope :self_and_following_user_post, -> (current_user){ where("user_id IN (?)", current_user.following.ids.uniq << current_user.id).order('created_at desc')}

	#Association
	has_many :videos
	has_many :images
	has_many :audios
	has_many :comments, as: :commentable

	belongs_to :user

  # Geocode address to lat. long
  geocoded_by :address,
    :latitude => :lat, :longitude => :long

  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  def get_comment_users
   self.comments.map(&:user).compact.map(&:name).uniq if self.comments.size > 0
  end
  
end
