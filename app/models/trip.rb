class Trip < ActiveRecord::Base

  # Association
  belongs_to :user
  
  has_many :trip_activities
  has_many :pictures, as: :imageable

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


  
end
