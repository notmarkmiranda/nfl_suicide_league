require 'rails_helper'

describe League, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :slug }
    it { should validate_uniqueness_of :slug }
  end

  describe 'relationships' do
  end

  describe 'methods' do
    let(:league) { create(:league) }

    context '#grant_membership' do
      let(:user) { create(:user) }
      it 'grants membership to a user' do
        expect {
          league.grant_membership(user)
        }.to change(UserLeague, :count).by(1)
      end

      it 'returns nil if user is already a member' do
        league.grant_membership(user)
        expect {
          league.grant_membership(user)
        }.to_not change(UserLeague, :count)
      end
    end

    context 'self#find_by_slug' do
      it 'returns the league' do
        expect(League.find_by_slug(league.slug)).to eq(league)
      end

      it 'returns nil if no league by that slug' do
        expect(League.find_by_slug('yup!')).to be nil
      end
    end
  end
end
