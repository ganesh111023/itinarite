class Trip < ActiveRecord::Base

  # Association
  belongs_to :user
  
  has_many :trip_activities
  has_many :pictures, as: :imageable

  has_many :comments, as: :commentable

  #Associative attributes
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :trip_activities, :allow_destroy => true

  #Validation
  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  # Geocode address to lat. long
  geocoded_by :address,
    :latitude => :lat, :longitude => :long

  after_validation :geocode, :if => lambda{ |obj| obj.address_changed? } 

  attr_writer :current_step
  attr_accessor :img_path
  # Instance methods
  def trip_locations_as_json
    locations = [] 
    #locations << self.as_json(only: [:addess, :lat,:long])
    self.trip_activities.each do |trip_activity| 
     locations << { address: trip_activity.place, lat: trip_activity.lat, long: trip_activity.long }
    end
    locations
  end

  def activities_location_from_date date
    locations = [] 
    self.trip_activities.where(activity_date: date).each do |trip_activity|
      locations << { address: trip_activity.place, lat: trip_activity.lat, long: trip_activity.long }
    end
    locations
  end

  def get_comment_users
   self.comments.map(&:user).compact.map(&:name).uniq if self.comments.size > 0
  end

  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[place activities]
  end

  def first_step?
    self.current_step == steps.first
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def activities_step?
    self.current_step == "activities"
  end

  def last_step?
    current_step == steps.last
  end


end
