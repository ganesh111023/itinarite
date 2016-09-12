class TripActivity < ActiveRecord::Base

  #Constant
  ACTIVITY_TYPE = ["Morning", "Evening", "Afternoon"]

  #Association
  belongs_to :trip

  has_many :pictures, as: :imageable

  #Associative attributes
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  
end
