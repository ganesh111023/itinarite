class Comment < ActiveRecord::Base
	belongs_to :trip
	belongs_to :user


	def get_time_diffrence
		RubyExtensions.time_diff(Time.now.utc, self.created_at.time)
	end
end
