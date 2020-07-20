# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home routing' do
  subject { { get: '/' } }
  let(:controller) { 'web/neighbour/home' }

  it { expect(get: '/').to route_to('web/neighbour/home#show') }
  it do    
    is_expected.to route_to(controller: controller,
                            action: 'show')
  end
end
