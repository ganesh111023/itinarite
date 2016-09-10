class Picture < ActiveRecord::Base

  #Association
  belongs_to :imageable, polymorphic: true

  # Mount Uploader
  mount_uploader :name, PhotoUploader
end
