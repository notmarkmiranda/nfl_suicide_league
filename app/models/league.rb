class League < ApplicationRecord
  has_secure_token :join_token

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :user_leagues
  has_many :users, through: :user_leagues

  before_validation :set_slug

  def grant_membership(user)
    return if users.include?(user)
    users << user
  end

  def self.find_by_slug(slug)
    find_by(slug: slug)
  end

  def to_param
    self.slug if slug
  end

  private

  def set_slug
    self.slug = name.parameterize if should_change_slug?
  end

  def should_change_slug?
    !name.blank? || name_changed?
  end
end
