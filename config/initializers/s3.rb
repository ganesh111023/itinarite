if Rails.env.production?
	CarrierWave.configure do |config|
	  config.fog_credentials = {
	      :provider               => "AWS",
	      :aws_access_key_id      => ENV['S3_KEY'],
	      :aws_secret_access_key  => ENV['S3_SECRET'],
	      :region                 => "us-east-2" # Change this for different AWS region. Default is 'us-east-1'
	  }
	  config.fog_directory  = ENV['S3_BUCKET']
	  config.storage = :fog
	end
else
	CarrierWave.configure do |config|
		config.storage = :file
	end
end