class Idol < ActiveRecord::Base
  validates :name, presence: true
  validates :avatar, presence: true

  mount_uploader :avatar, ImageUploader
end