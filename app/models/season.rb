class Season < ApplicationRecord
  validates :year, presence: true, uniqueness: true

  has_many :weeks

  def current_week
    now = Time.current
    week = weeks.where("start_date <= ? AND end_date >= ?", now, now).limit(1).first
    week.nil? ? check_date(now) : week
  end

  def end_date
    weeks.max_by(&:end_date).end_date
  end

  def self.current
    where(active: true).first
  end

  def start_date
    weeks.min_by(&:start_date).start_date
  end

  private

  def check_date(date)
    first_week = weeks.first
    return first_week if date < first_week.start_date
  end
end
