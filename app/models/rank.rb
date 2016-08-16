class Rank < ActiveRecord::Base
  belongs_to :idol
  validates :all_rank, presence: true
  validates :month_rank, presence: true
  validates :week_rank, presence: true
  validates :idol_id, presence: true, uniqueness: true

  scope :by_week, -> () { order(week_rank: :asc) }
  scope :by_month, -> () { order(month_rank: :asc) }
  scope :by_all, -> () { order(all_rank: :asc) }
end