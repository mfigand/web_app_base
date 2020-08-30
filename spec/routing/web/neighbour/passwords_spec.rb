# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'passwords routing' do
  let(:controller) { 'web/neighbour/passwords' }

  it 'should route to #new' do
    expect(get: '/passwords/new').to route_to(controller: controller,
                                               action: 'new')
  end

  it 'should route to #create' do
    expect(post: '/passwords').to route_to(controller: controller,
                                           action: 'create')
  end
end
