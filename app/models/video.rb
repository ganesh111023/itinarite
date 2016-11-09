class Video < ActiveRecord::Base

	belongs_to :post

	mount_uploader :video,  VideoUploader
	
end
