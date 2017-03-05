require 'rails_helper'

RSpec.describe 'routing to /events/mine', type: 'routing' do
  it 'routes /events/mine to events#mine' do
    expect(get: '/events/mine').to route_to(controller: 'events', action: 'mine')
  end
end
