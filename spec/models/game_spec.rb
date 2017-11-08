require 'rails_helper'

describe Game, type: :model do
  describe 'validations' do
    it { should validate_presence_of :start }
    it { should validate_presence_of :home_id }
    it { should validate_presence_of :away_id }
    it { should validate_uniqueness_of(:home_id).scoped_to(:away_id) }
    it { should validate_presence_of :week_id }
  end

  describe 'relationships' do
    it { should belong_to :week }
    it { should belong_to :home_team }
    it { should belong_to :away_team }
  end

  describe 'methods'
end
