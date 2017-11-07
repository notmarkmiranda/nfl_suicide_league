require 'rails_helper'

describe UserLeague, type: :model do
  describe 'validations' do
  end

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :league }
  end

  describe 'methods' do
  end
end
