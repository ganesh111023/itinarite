  class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:timeoutable

  #mount uploader to upload photo
  mount_uploader :profile_picture, PhotoUploader

  #Association
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  # get user's following user list
  has_many :following, through: :active_relationships,  source: :followed
  # get user follower user list
  has_many :followers, through: :passive_relationships, source: :follower

  #Trip association
  has_many :trips


  # accessor
  attr_accessor :profile_pic

  #validation
  validates :name, presence: true
  #validates :profile_picture, presence: true
  #validates :address, presence: true

  #scope
    scope :get_list_of_user_except_current_user, -> (id) { where("id !=?", id) }

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
