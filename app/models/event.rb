class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types, dependent: :destroy

  accepts_nested_attributes_for :venue, :ticket_types

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  scope :published, -> { where.not(published_at: nil) }
  # def self.published?
  #  where(published_at: nil)
  # end

  def self.upcoming
    published.where("starts_at > ?", Time.now)
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
