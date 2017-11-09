require 'rails_helper'

describe Week, type: :model do
  describe 'validations' do
    it { should validate_presence_of :number }
    it { should validate_uniqueness_of(:number).scoped_to(:season_id) }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :season_id }
  end

  describe 'relationships' do
    it { should belong_to :season }
    it { should have_many :games }
  end

  describe 'methods' do
    context '#formatted_week_ending' do
      it 'returns a formatted date' do
        week = create(:week, end_date: Date.new(2015, 5, 9))
        expect(week.formatted_week_ending).to eq('May 9, 2015')
      end
    end
  end

end
