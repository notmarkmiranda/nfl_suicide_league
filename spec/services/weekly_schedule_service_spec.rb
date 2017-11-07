require 'rails_helper'

describe WeeklyScheduleService, type: :service do
  context 'service can receive a response and parse xml' do
    let(:first_response) {
      {
        :eid=>"2017110200", :gsis=>"57354", :d=>"Thu",
        :t=>"8:25", :q=>"F", :k=>"", :h=>"NYJ", :hnn=>"jets",
        :hs=>"34", :v=>"BUF", :vnn=>"bills", :vs=>"21",
        :p=>"", :rz=>"", :ga=>"", :gt=>"REG"
      }
    }

    let(:last_response) {
        {
          :eid=>"2017110600", :gsis=>"57366", :d=>"Mon",
          :t=>"8:30", :q=>"F", :k=>"", :h=>"GB", :hnn=>"packers",
          :hs=>"17", :v=>"DET", :vnn=>"lions", :vs=>"30",
          :p=>"", :rz=>"", :ga=>"", :gt=>"REG"
        }
    }

    it 'converts xml to a hash' do
      VCR.use_cassette('service_converts_to_hash', record: :new_episodes) do
        weekly_schedule = described_class.new(season: 2017, type: 'REG', week: 9)

        expect(weekly_schedule.parsed_xml.count).to eq(13)
        expect(weekly_schedule.parsed_xml.first).to eq(first_response)
        expect(weekly_schedule.parsed_xml.last).to eq(last_response)
      end
    end

    it 'returns nil if nothing inside ss tag exists' do
      VCR.use_cassette('service returns nil', record: :new_episodes) do
        weekly_schedule = described_class.new(season: 2017, type: 'REG', week: 90)

        expect(weekly_schedule.parsed_xml).to be nil
      end
    end
  end
end
