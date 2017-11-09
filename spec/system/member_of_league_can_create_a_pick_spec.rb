require 'rails_helper'

describe 'Member of a league can create a pick' do
  let(:user) { create(:user) }
  let(:league) { create(:league) }
  let(:week) { create(:week, start_date: Date.new(2011, 1, 1), end_date: Date.new(2011, 1, 7)) }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    league.grant_membership(user)
    create(:week, start_date: Date.new(2011, 1, 8), end_date: Date.new(2011, 1, 14), season: week.season)
    create_list(:game, 2, week: week)
    travel_to(Date.new(2011, 1, 3))
  end

  after do
    travel_back
  end

  scenario 'it shows the current week' do
    visit league_path(league)
    click_link("Make Week ##{week.number} Pick")

    expect(page).to have_content("Week ending: January 7, 2011")
  end

  scenario 'user can pick a game' do
    visit new_league_pick_path(league)
    click_button "Pick #{Team.first.name.capitalize} to lose."

    expect(current_path).to eq(league_pick_path(league, Pick.last))
    expect(page).to have_content("#{user.short_name} - Week ##{week.number} Pick - #{Pick.last.team.name.capitalize} to lose.")
  end
end
