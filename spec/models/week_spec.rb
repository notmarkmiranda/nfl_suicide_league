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
  end

  describe 'methods'

end
