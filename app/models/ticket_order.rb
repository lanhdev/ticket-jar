class TicketOrder < ApplicationRecord
  belongs_to :ticket_type
  validates :name, :phone, :address, presence: true
  validates :quantity, presence: true, numericality: { less_than_or_equal_to: 200 }

  def quantity_remain
    ticket_type.max_quantity -= self.quantity
    ticket_type.save
  end

  def ticket_type_price
    ticket_type.price unless nil
  end

  def total_price_calc
    self.total_price = ticket_type_price * self.quantity
  end
end
