# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PingController, type: :controller do
  describe 'GET ping' do
    it 'check ping' do
      get :ping
      expect(response.body).to eq({ data: 'pong' }.to_json)
    end
  end
end
