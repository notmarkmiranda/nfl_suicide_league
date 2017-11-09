class Pick < ApplicationRecord
  validates :user_league_id, presence: true
  validates :team_id, presence: true
  validates :game_id, presence: true

  belongs_to :user_league
  belongs_to :team
  belongs_to :game

  def game_team_name
    team.name.capitalize
  end

  def game_week
    game.week.number
  end
end
