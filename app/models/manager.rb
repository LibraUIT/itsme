class Manager < ActiveRecord::Base

  validates :fullname, presence: true
  mount_uploader :avatar, ImageUploader

end
