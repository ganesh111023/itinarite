class Trip < ActiveRecord::Base

	# Association
  belongs_to :user
  has_many :trip_activities
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  
end
