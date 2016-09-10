class Idol < ActiveRecord::Base

  extend FriendlyId

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  has_one :user, foreign_key: 'idol_id', dependent: :destroy, autosave: true
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['idol_id'].blank? },
                                       allow_destroy: true

  has_one :rank, dependent: :destroy

  validates :name, presence: true
  validates :avatar, presence: true
  validates :itsme_id, uniqueness: true, if: 'itsme_id.present?'

  mount_uploader :avatar, ImageUploader

  friendly_id :name, use: [:slugged, :history, :finders]

  default_scope { order(raking: :asc) }

  scope :wait_approved, -> () { where(approved: false) }
  scope :approved, -> () { where(approved: true) }

  after_save :update_user

  def self.update_sort
    Idol.approved.update_all('sort = random()*999 ')
  end

  def update_user
    if itsme_id.present?
      if user.nil?
        user = User.create(username: itsme_id.to_s,
                           email: "#{id}-idol-#{itsme_id}@itsme.sg",
                           password: '12345678',
                           idol_id: id)
        user.save!
      end
    end
  end

end
