require 'rails_helper'

RSpec.describe 'routing to /events/upcoming', type: 'routing' do
  it 'routes /upcoming to events#index' do
    expect(get: '/events/upcoming').to route_to(controller: 'events', action: 'index')
  end
end
