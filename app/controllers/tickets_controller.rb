class TicketsController < ApplicationController
  before_action :set_ticket_type, only: [:destroy]

  def index
    @event = Event.find(params[:event_id])
    
    if params[:name]
      @ticket_type = TicketType.create(ticket_type_params)
      redirect_to event_tickets_path
    end
  end

  def destroy
    @ticket_type.destroy
    redirect_to event_tickets_path, flash: {info: 'Ticket Type was deleted successfully'}
  end

  private
    def set_ticket_type
      @event = Event.find(params[:event_id])
      @ticket_type = @event.ticket_types.find(params[:id])
    end

    def ticket_type_params
      params.permit(:event_id, :name, :price, :max_quantity)
    end
end
