class TripActivity < ActiveRecord::Base

  #Association
  belongs_to :trip
  has_many :picture, as: :imageable
  
end
