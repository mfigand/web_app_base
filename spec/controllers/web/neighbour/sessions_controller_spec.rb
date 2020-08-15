# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Neighbour::SessionsController, type: :controller do
  let(:neighbour) { create(:user) }

  before(:example) do
    neighbour.roles.create(name: 'neighbour')
    stub_warden(request, neighbour)
  end

  describe 'GET sessions' do
    it '#new session success' do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe 'POST sessions' do
    skip '#create sessions' do
      post :create

      expect(response.status).to redirect_to home_path
    end
  end

  describe 'DELETE sessions' do
    skip '#destroy sessions' do
      delete :destroy

      expect(response.status).to redirect_to new_sessions_path
    end
  end
end
