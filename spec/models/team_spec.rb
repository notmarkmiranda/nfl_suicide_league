require 'rails_helper'

RSpec.describe Team, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :abbreviation }
    it { should validate_uniqueness_of :name }
    it { should validate_uniqueness_of :abbreviation }
  end

  context 'relationships' do
  end

  context 'methods' do
  end
end
