class SocialProvider < ActiveRecord::Base
	belongs_to :user

	#validation
	validates :provider,presence: true
	validates :uid,presence: true
	validates :user_id,presence: true

	validates_uniqueness_of :uid, { scope: [:provider, :user_id] }
end
