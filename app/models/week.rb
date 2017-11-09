class Week < ApplicationRecord
  validates :number, presence: true, uniqueness: { scope: :season_id }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :season_id, presence: true

  belongs_to :season
  has_many :games

  default_scope { order(end_date: :asc) }

  def formatted_week_ending
    end_date.strftime('%B %-e, %Y')
  end
end
