class Rank < ActiveRecord::Base
  belongs_to :idol
  validates :all_rank, presence: true
  validates :month_rank, presence: true
  validates :week_rank, presence: true
  validates :idol_id, presence: true, uniqueness: true
end