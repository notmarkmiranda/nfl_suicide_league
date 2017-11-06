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
