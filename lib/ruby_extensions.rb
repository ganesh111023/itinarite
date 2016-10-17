module RubyExtensions
  def self.time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff
    if hours > 0 && minutes > 0
      "#{hours} hours and #{minutes} minutes ago"
    elsif  minutes > 0
      "#{minutes} minutes ago"
    elsif seconds.present?
      "Just now"
    end
  end

  class ActiveRecord::Base     
    #model instance method      
    def get_time_diffrence
      RubyExtensions.time_diff(Time.now.utc, self.created_at.time)
    end
  end

end