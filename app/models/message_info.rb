class MessageInfo < ActiveRecord::Base
	belongs_to :MessageInfo

	scope :available_message, -> (id) { where("status =? and user_id =?", "available",id) }
end
