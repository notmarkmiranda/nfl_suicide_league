class Team < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true, uniqueness: true
end
