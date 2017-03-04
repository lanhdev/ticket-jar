class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :ticket_order, dependent: :destroy
end
