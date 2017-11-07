require 'rails_helper'

describe LeagueCreator, type: :model do
  describe 'methods' do
    let(:league) { build(:league) }
    let(:user) { create(:user) }

    before do
      @lc = described_class.new(league, user)
    end

    it 'stores a league and user' do
      expect(@lc.league).to eq(league)
      expect(@lc.user).to eq(user)
    end

    it 'returns true for a successful save' do
      expect(@lc.save).to be true
    end

    it 'returns false for an unsuccessful save' do
      league.name = ''
      lc = described_class.new(league, user)

      expect(lc.save).to be false
    end
  end
end
