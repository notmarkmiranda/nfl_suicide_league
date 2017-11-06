require 'rails_helper'

describe SessionsController, type: :controller do
  let!(:user) { create(:user) }

  describe 'GET#new' do
    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
    end

    it 'redirects a logged in user' do
      get :new, session: { user_id: user.id }

      expect(response).to redirect_to root_path
    end
  end

  describe 'POST#create' do
    it 'redirects to dashboard_path on successful log in' do
      post :create, params: { session: { email_address: user.email_address, password: 'password' } }

      expect(response).to redirect_to dashboard_path
    end

    it 'renders the new template on bad password' do
      post :create, params: { session: { email_address: user.email_address, password: 'passwordx' } }

      expect(response).to render_template :new
    end

    it 'renders the new template on bad password' do
      post :create, params: { session: { email_address: "#{user.email_address}x", password: 'password' } }

      expect(response).to render_template :new
    end

    it 'redirects a logged in user' do
      post :create, session: { user_id: user.id }, params: { session: { email_address: user.email_address, password: 'password' } }

      expect(response).to redirect_to root_path
    end
  end

  describe 'GET#destroy' do
    it 'redirects to root path on log out' do
      get :destroy, session: { user_id: user.id }

      expect(response).to redirect_to root_path
    end
  end
end
