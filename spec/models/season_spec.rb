require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'validations' do
    it { should validate_presence_of :year }
    it { should validate_uniqueness_of :year }
  end

  describe 'relationships' do
    it { should have_many :weeks }
  end

  describe 'methods' do
    let!(:this_season) { create(:season, year: 2018, active: true) }
    let!(:first_week) { create(:week, season: this_season, start_date: Date.new(2017, 11, 1), end_date: Date.new(2017, 11, 8)) }
    let!(:second_week) { create(:week, season: this_season, start_date: Date.new(2017, 11, 9), end_date: Date.new(2017, 11, 15)) }

    describe '#current_week' do
      it 'returns the week between start and end dates' do
        travel_to(Date.new(2017, 11, 5)) do
          expect(this_season.current_week).to eq(first_week)
        end
      end

      it 'returns the week on the last day of the week' do
        travel_to(Date.new(2017, 11, 8)) do
          expect(this_season.current_week).to eq(first_week)
        end
      end

      it 'returns the following week after the last day of the previous week' do
        travel_to(Date.new(2017, 11, 10)) do
          expect(this_season.current_week).to eq(second_week)
        end
      end

      it 'returns nil when there is no week in place' do
        travel_to(Date.new(2017, 11, 21)) do
          expect(this_season.current_week).to be nil
        end
      end

      it 'returns the first week when its before the season' do
        travel_to(Date.new(2017, 10, 31)) do
          expect(this_season.current_week).to eq(first_week)
        end
      end
    end

    describe 'self#current' do
      let!(:last_season) { create(:season, year: 2016, active: false) }
      let!(:week_one) { create(:week, season: last_season, start_date: Date.new(2016, 11, 1), end_date: Date.new(2016, 11, 4)) }
      let!(:week_two) { create(:week, season: last_season, start_date: Date.new(2016, 11, 8), end_date: Date.new(2016, 11, 11)) }


      it 'returns the current season' do
        expect(Season.current).to eq(this_season)
      end

      it 'returns nil if there is no active season' do
        this_season.update(active: false)
        expect(Season.current).to be nil
      end
    end

    describe '#start_date and #end_date' do
      let(:season) { create(:season) }

      it 'returns the start date of the season' do
        create(:week, season: season, start_date: Date.new(2011, 1, 1), end_date: Date.new(2011, 1, 5))
        create(:week, season: season, start_date: Date.new(2011, 1, 8), end_date: Date.new(2011, 1, 12))

        expect(season.start_date).to eq(Date.new(2011, 1, 1))
        expect(season.end_date).to eq(Date.new(2011, 1, 12))
      end
    end
  end
end
