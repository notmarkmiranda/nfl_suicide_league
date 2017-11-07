require 'rails_helper'

RSpec.describe Season, type: :model do
  describe 'validations' do
    it { should validate_presence_of :year }
    it { should validate_uniqueness_of :year }
  end

  describe 'relationships' do
  end

  describe 'methods' do
  end
end
