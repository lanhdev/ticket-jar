require 'rails_helper'

RSpec.describe 'events/index.html.erb', type: :view do
  it 'render _card partial for each event' do
    event_1 = Event.new name: 'MMA'
    event_2 = Event.new name: 'UFC'

    event_1.save(validate: false)
    event_2.save(validate: false)
    assign(:events, [event_1,event_2])
    render
    expect(view).to render_template(partial: '_card', count: 2)
  end

  it 'display events' do
    event_1 = Event.new(name: 'MMA', published_at: Time.now)
    event_2 = Event.new(name: 'UFC', published_at: Time.now)
    
    event_1.save(validate: false)
    event_2.save(validate: false)
    assign(:events, [event_1, event_2])
    render

    expect(rendered).to include 'MMA'
    expect(rendered).to include 'UFC'
  end
end