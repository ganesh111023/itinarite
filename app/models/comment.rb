class Comment < ActiveRecord::Base
	#Association
	belongs_to :trip
	belongs_to :user
	
end
