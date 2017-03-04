class TicketOrdersController < ApplicationController
  before_action :set_ticket_order, only: [:show]

  def show
  end

  def new
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket_order = TicketOrder.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket_types = @event.ticket_types
    @ticket_order = TicketOrder.new ticket_order_params
    @ticket_order.total_price_calc
    @ticket_order.quantity_remain
    if @ticket_order.save
      redirect_to event_ticket_order_path(id: @ticket_order.id), flash: {success: 'Order was created successfully'}
    else
      render 'new'
    end
  end

  private
    def set_ticket_order
      @ticket_order = TicketOrder.find(params[:id])      
    end

    def ticket_order_params
      params.require(:ticket_order).permit(:ticket_type_id, :name, :phone, :address, :quantity)
    end
end
