class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:timeoutable

  #mount uploader to upload photo
  mount_uploader :profile_picture, PhotoUploader

  #validation
  validates :name, presence: true
  #validates :profile_picture, presence: true
  validates :address, presence: true

end
