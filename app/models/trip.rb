class Trip < ActiveRecord::Base

  # Association
  belongs_to :user
  
  has_many :trip_activities
  has_many :pictures, as: :imageable

  #Associative attributes
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :trip_activities, :allow_destroy => true
  
end
