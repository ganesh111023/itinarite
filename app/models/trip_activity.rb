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
  
  
end
