class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true

  has_many :home_games, class_name: 'Game', foreign_key: :home_id
  has_many :away_games, class_name: 'Game', foreign_key: :away_id
  has_many :picks
end
