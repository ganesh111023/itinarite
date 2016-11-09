class Post < ActiveRecord::Base

	#sope
	scope :self_and_following_user_post, -> (current_user){ where("user_id IN (?)", current_user.following.ids.uniq << current_user.id).order('created_at desc')}

	#Association
	has_many :videos, dependent: :destroy
	has_many :pictures, as: :imageable, dependent: :destroy
	has_many :audios, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy

	belongs_to :user


	accepts_nested_attributes_for :pictures
	accepts_nested_attributes_for :videos
	accepts_nested_attributes_for :audios
  # Geocode address to lat. long
  geocoded_by :address,
    :latitude => :lat, :longitude => :long

  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

  def get_comment_users
   self.comments.map(&:user).compact.map(&:name).uniq if self.comments.size > 0
  end
  
end
