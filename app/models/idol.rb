class Idol < ActiveRecord::Base
  extend FriendlyId

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :avatar, presence: true
  validates :rank, presence: true, uniqueness: true

  mount_uploader :avatar, ImageUploader

  friendly_id :name, use: [:slugged, :history, :finders]
end