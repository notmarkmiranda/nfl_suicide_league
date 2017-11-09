require 'rails_helper'

describe PicksController, type: :controller do
  describe 'GET#show' do
    let(:pick) { create(:pick) }
    let(:user) { pick.user_league.user }
    let(:league) { pick.user_league.league }

    it 'renders the show template' do
      get :show, session: { user_id: user.id }, params: { id: pick.id, league_slug: league.slug }
      expect(response).to render_template :show
    end

    it 'redirects to root_path if not member of the league' do
      user2 = create(:user)
      get :show, session: { user_id: user2.id }, params: { id: pick.id, league_slug: league.slug }
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET#new' do
    let(:user_league) { create(:user_league) }
    let(:user) { user_league.user }
    let(:league) { user_league.league }
    let(:week) { create(:week) }

    it 'renders the new template' do
      allow_any_instance_of(Season).to receive(:current_week).and_return(week)
      get :new, session: { user_id: user.id }, params: { league_slug: league.slug }
      expect(response).to render_template :new
    end
  end

  describe 'POST#create' do
    let(:user_league) { create(:user_league) }
    let(:user) { user_league.user }
    let(:league) { user_league.league }
    let(:game) { create(:game) }
    let(:ht_id) { game.home_team.id }

    it 'redirects to league pick path on successful creation' do
      post :create, session: { user_id: user.id }, params: { pick: { team_id: ht_id, game_id: game.id },  league_slug: league.slug }
      expect(response).to redirect_to league_pick_path(league, Pick.last)
    end

    it 'renders the new template' do
      post :create, session: { user_id: user.id }, params: { pick: { game_id: game.id },  league_slug: league.slug }
      expect(response).to render_template :new
    end

    it 'redirects to the root path if not a member of the league' do
      user2 = create(:user)
      post :create, session: { user_id: user2.id }, params: { pick: { team_id: ht_id, game_id: game.id },  league_slug: league.slug }
      expect(response).to redirect_to root_path
    end
  end
end
