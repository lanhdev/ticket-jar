class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types, dependent: :destroy

  accepts_nested_attributes_for :venue

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    Event.where("starts_at > ?", Time.now)
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  delegate :name, to: :venue, allow_nil: true, prefix: true
  # def venue_name
  #   if venue
  #     venue.name
  #   else
  #     nil
  #   end
  # end
end
