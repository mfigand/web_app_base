# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ping requests' do
  describe 'GET api/v1/ping' do
    subject(:endpoint_call) { get '/api/v1/ping' }

    it do
      subject
      expect(response.body).to eq({ data: 'pong' }.to_json)
    end
  end
end
