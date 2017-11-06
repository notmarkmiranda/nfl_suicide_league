require 'rails_helper'

describe 'User can log in and out', type: :system do
  let!(:user) { create(:user) }

  scenario 'allows a user to log in and out' do
    visit log_in_path

    fill_in 'E-Mail Address', with: user.email_address
    fill_in 'Password', with: 'password'
    click_button 'Log In!'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Log Out')
    expect(page).to_not have_link('Log In')

    click_link 'Log Out'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log In')
    expect(page).to_not have_link('Log Out')
  end

  scenario 'does not allow user to log in with bad password' do
    visit log_in_path

    fill_in 'E-Mail Address', with: user.email_address
    fill_in 'Password', with: 'passwordx'
    click_button 'Log In!'

    expect(page).to have_button('Log In!')
  end

  scenario 'does not allow user to log in with bad password' do
    visit log_in_path

    fill_in 'E-Mail Address', with: "#{user.email_address}x"
    fill_in 'Password', with: 'password'
    click_button 'Log In!'

    expect(page).to have_button('Log In!')
  end
end
