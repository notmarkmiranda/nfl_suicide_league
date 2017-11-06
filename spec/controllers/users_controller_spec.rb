require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET#show' do
    it 'renders the show template for a logged in user' do
      get :show, session: { user_id: user.id }

      expect(response).to render_template :show
    end

    it 'redirects to the root path for no user' do
      get :show

      expect(response).to redirect_to root_path
    end
  end

  describe 'GET#new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template :new
    end

    it 'redirects a logged in user to the root path' do
      get :new, session: { user_id: user.id }

      expect(response).to redirect_to root_path
    end
  end

  describe 'POST#create' do
    let(:attrs) { attributes_for(:user) }

    it 'redirects to dashboard_path on successful creation' do
      post :create, params: { user: attrs }

      expect(response).to redirect_to dashboard_path
    end

    it 'renders the new template on unsuccesful creation' do
      post :create, params: { user: attrs.except(:first_name) }

      expect(response).to render_template :new
    end

    it 'redirects to root path if a user is logged in' do
      post :create, params: { user: attrs }, session: { user_id: user.id }

      expect(response).to redirect_to root_path
    end
  end
end
