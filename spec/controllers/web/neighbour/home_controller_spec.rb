# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Neighbour::HomeController, type: :controller do
  let(:neighbour) { create(:user) }

  before(:example) do
    neighbour.roles.create(name: 'neighbour')
    stub_warden(request, neighbour)
  end

  describe 'GET home' do
    it '#show home with correct credentials' do
      get :show

      expect(response.status).to eq(200)
    end
  end
end
