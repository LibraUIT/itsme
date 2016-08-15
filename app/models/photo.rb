class Photo < ActiveRecord::Base
  belongs_to :idol
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end