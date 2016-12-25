class TripActivity < ActiveRecord::Base

  #Constant
  ACTIVITY_TYPE = ["Morning", "Evening", "Afternoon"]

  #Association
  belongs_to :trip

  has_many :pictures, as: :imageable

  #Associative attributes
  accepts_nested_attributes_for :pictures, :allow_destroy => true

  #Scope
  scope :morning_activities, -> { where(activity_type: ACTIVITY_TYPE[0]) }
  scope :afternoon_activities, -> { where(activity_type: ACTIVITY_TYPE[2]) }
  scope :evening_activities, -> { where(activity_type: ACTIVITY_TYPE[1]) }

  #Validations
  validates :place, presence: true
  validates :description, presence: true
  validates :activity_date, presence: true

  #Geocode address to lat. long
  geocoded_by :place,
    :latitude => :lat, :longitude => :long

  after_validation :geocode, :if => lambda{ |obj| obj.place_changed? } 

  def location_as_json
    location = []
    location << {lat: self.lat, long: self.long, address: self.place, formated_address: (self.place.split(",").last.strip + ":" + self.created_at.strftime("%b %y"))}
    location.to_json
  end
  
end
