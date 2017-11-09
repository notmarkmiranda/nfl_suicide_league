class UserLeague < ApplicationRecord
  validates :user_id, presence: true, uniqueness: { scope: :league_id }
  validates :league_id, presence: true
  validates :role, presence: true

  belongs_to :user
  belongs_to :league
  has_one :pick

  enum role: { user: 0, admin: 1, super: 2 }
end
