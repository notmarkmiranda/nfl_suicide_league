require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email_address }
    it { should validate_uniqueness_of :email_address }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of :phone_number }
  end

  describe 'relationships' do
  end

  describe 'methods' do
    context '#short_name' do
      it 'returns the short name of a user' do
        user = create(:user, first_name: 'mark', last_name: 'miranda')
        expect(user.short_name).to eq('Mark M.')
      end
    end
  end
end
