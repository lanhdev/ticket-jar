require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "test past events"

  describe '.upcoming' do
    it 'returns [] when there is no event' do
      expect(Event.upcoming).to eq []
    end

    it 'returns 1 event when there is 1 event' do
      event = Event.new starts_at: 1.day.from_now
      event.save(validate: false)
      expect(Event.upcoming).to eq [event]
    end

    it 'returns upcoming events' do
      a = Event.new starts_at: 1.day.ago
      b = Event.new starts_at: 1.day.from_now
      c = Event.new starts_at: Date.parse("2017/12/01")

      a.save(validate: false)
      b.save(validate: false)
      c.save(validate: false)
      expect(Event.upcoming).to match_array [b, c]
    end
  end

  describe "#venue_name" do
    it "returns nil if there's no value" do
      event = Event.new
      expect(event.venue_name).to eq nil
    end
    it "returns venue name" do
      venue = Venue.new name: "GEM Center"
      event = Event.new venue: venue
      expect(event.venue_name).to eq "GEM Center"
    end
  end
end
