class Relationship < ActiveRecord::Base
  #Association
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  #Validation
  validates :follower_id, presence: true
  validates :followed_id, presence: true

end
