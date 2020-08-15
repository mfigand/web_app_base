# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sessions routing' do
  let(:controller) { 'web/neighbour/sessions' }

  it '#create route to create action' do
    expect(post: '/sessions').to route_to(controller: controller,
                                          action: 'create')
  end

  it '#delete route to delete action' do
    expect(delete: '/sessions').to route_to(controller: controller,
                                            action: 'destroy')
  end
end
