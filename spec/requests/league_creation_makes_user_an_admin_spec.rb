require 'rails_helper'

describe 'league creation also creates a user_league record' do
  let(:user) { create(:user) }
  let(:attrs) { attributes_for(:league) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  it 'creates a user_league record with an admin role' do
    expect {
      post '/leagues', params: { league: attrs }
    }.to change(UserLeague, :count).by(1)
  end
end
