class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
          :rememberable, :trackable, :validatable, :timeoutable,
          :omniauthable, :omniauth_providers => [:facebook, :twitter,:linkedin, :google_oauth2 ] 
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
  has_many :posts
  #conversation
  has_many :conversations, :foreign_key => :sender_id

  has_many :social_providers


  #Accessor
  attr_accessor :profile_pic

  #validation
  validates :name, presence: true
  #validates :profile_picture, presence: true
  #validates :address, presence: true

  #scope
  scope :get_list_of_user_except_current_user, -> (id) { where.not(id: id) }

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
    self.reload
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
    self.reload
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Recent trips
  def recent_trips
    self.trips.order("created_at desc").limit(2) if self.trips.present?
  end

  # Trips Locations
  def trips_locations
    locations = []
      self.trips.each do |t|
        locations << {
          lat: t.lat, long: t.long, address: t.address, formated_address: (t.address.split(",").last.strip + ":" + t.start_date.strftime("%b %y"))
        }
      end  
    locations
  end

  def name_capitalize
    self.name.camelize
  end

  def create_social_provider(auth)
    social_providers.create(provider: auth.provider, uid: auth.uid)
  end


 
  def self.from_omniauth(auth)
    if usr = where(email: auth.info.email).first
      if user = usr.social_providers.where(provider: auth.provider, uid: auth.uid).present?
         usr
      else
        usr.create_social_provider(auth)
        usr
      end
    else
      new_user = create(name: auth.info.name, email: auth.info.email, password: (Devise.friendly_token[0,20]) )
      new_user.create_social_provider(auth)
      new_user
    end
  end
end
