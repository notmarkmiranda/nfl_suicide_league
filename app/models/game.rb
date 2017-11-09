class Game < ApplicationRecord
  validates :start, presence: true
  validates :home_id, presence: true, uniqueness: { scope: :away_id }
  validates :away_id, presence: true
  validates :week_id, presence: true

  belongs_to :week
  belongs_to :home_team, class_name: 'Team', foreign_key: :home_id
  belongs_to :away_team, class_name: 'Team', foreign_key: :away_id
  has_many :picks
end
