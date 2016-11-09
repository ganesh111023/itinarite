class Audio < ActiveRecord::Base

	belongs_to :post

	mount_uploader :audio,  AudioUploader
end
