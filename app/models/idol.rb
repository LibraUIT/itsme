class Idol < ActiveRecord::Base
  extend FriendlyId

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  has_one :rank, dependent: :destroy

  validates :name, presence: true
  validates :avatar, presence: true

  mount_uploader :avatar, ImageUploader

  friendly_id :name, use: [:slugged, :history, :finders]

  default_scope { order(sort: :asc) }

  scope :wait_approved, -> () { where(approved: false) }
  scope :approved, -> () { where(approved: true) }

  def self.update_sort
    Idol.approved.update_all("sort = random()*999 ")
  end
end