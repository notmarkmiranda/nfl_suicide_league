require 'rails_helper'

describe LeaguesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET#show' do
    it 'renders the show template' do
      league = create(:league)
      create(:week)
      get :show, params: { slug: league.slug }

      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    it 'renders the new template for a user' do
      get :new, session: { user_id: user.id }

      expect(response).to render_template :new
    end

    it 'redirects a non-user to the root path' do
      get :new

      expect(response).to redirect_to root_path
    end
  end

  describe 'POST#create' do
    let(:attrs) { attributes_for(:league) }

    it 'redirects to the league page on successful creation' do
      post :create, session: { user_id: user.id }, params: { league: attrs }

      expect(response).to redirect_to(League.last)
    end

    it 'renders the new template on unsuccessful creation' do
      post :create, session: { user_id: user.id }, params: { league: { name: '' } }

      expect(response).to render_template :new
    end

    it 'redirects a non-user to the root path' do
      post :create, params: { league: attrs }

      expect(response).to redirect_to root_path
    end
  end
end
