require 'rails_helper'

describe 'User can sign up', type: :system do
  scenario 'allows a user to sign up' do
    visit sign_up_path

    fill_in 'E-Mail Address', with: 'test@example.com'
    fill_in 'First Name', with: 'Test'
    fill_in 'Last Name', with: 'Example'
    fill_in 'Password', with: 'Password'
    click_button 'Sign Up!'

    expect(current_path).to eq(dashboard_path)
  end
end
