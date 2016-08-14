class Idol < ActiveRecord::Base
  extend FriendlyId

  validates :name, presence: true
  validates :avatar, presence: true

  mount_uploader :avatar, ImageUploader

  friendly_id :name, use: [:slugged, :history, :finders]
end