require 'rails_helper'

describe UserLeague, type: :model do
  describe 'validations' do
    it { should validate_presence_of :user_id }
    it do
      create(:user_league)
      should validate_uniqueness_of(:user_id).scoped_to(:league_id)
    end
    it { should validate_presence_of :league_id }
    it { should validate_presence_of :role }
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :league }
  end

  describe 'methods' do
    describe 'enums' do
      let(:ul) { create(:user_league, role: role) }

      context '#user' do
        let(:role) { 0 }

        it { expect(ul.user?).to be true }
      end

      context '#admin' do
        let(:role) { 1 }

        it { expect(ul.admin?).to be true }
      end

      context '#super' do
        let(:role) { 2 }

        it { expect(ul.super?).to be true }
      end

      context 'can change roles' do
        let(:role) { 0 }
        it do
          ul.super!

          expect(ul.role).to eq('super')
        end
      end
    end
  end
end
