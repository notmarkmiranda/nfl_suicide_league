require 'rails_helper'

describe Pick, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_league_id }
    it { should validate_presence_of :team_id }
    it { should validate_presence_of :game_id }
  end

  describe 'relationships' do
    it { should belong_to :user_league }
    it { should belong_to :team }
    it { should belong_to :game }
  end

  describe 'methods' do
    let(:pick) { create(:pick, team: team) }

    context '#game_team_name' do
      let(:team) { create(:team, name: 'rams') }

      it 'returns the teams name' do
        expect(pick.game_team_name).to eq('Rams')
      end
    end

    context '#game_week' do
      let(:team) { create(:team) }
      let(:week) { pick.game.week }

      it 'returns the game week' do
        week.update(number: 99)

        expect(pick.game_week).to eq(99)
      end
    end
  end
end
