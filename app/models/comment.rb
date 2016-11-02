class Comment < ActiveRecord::Base
  #Association
  belongs_to :commentable, polymorphic: true
  belongs_to :user
	
end
