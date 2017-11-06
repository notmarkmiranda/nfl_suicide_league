require 'rails_helper'

describe 'User can create a league', type: :system do
  before do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  scenario 'it creates a league with valid things' do
    visit new_league_path

    fill_in 'League Name', with: 'Test League'
    click_button 'Create League'

    expect(current_path).to eq(league_path(League.last))
    expect(page).to have_content('Test League')
  end

  scenario 'it renders the new template with an invalid name' do
    visit new_league_path

    click_button 'Create League'

    expect(page).to have_button('Create League')
  end
end
