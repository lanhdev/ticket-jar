class EventsController < ApplicationController
  before_action :set_event, only: [:show, :publish, :edit, :update]

  def index
    if params[:search]
      @events = Event.search(params[:search])
    else
      @events = Event.all.published.upcoming
    end
  end

  def mine
    @events_id = current_user.events.all.select(:id)
    @events = Event.where(id: @events_id)
  end

  def show
  end

  def publish
    if @event.have_enough_ticket_types?
      @event.published_at = Time.now
      @event.save!
      redirect_to root_path, flash: { success: 'Event has been published' }
    else
      flash[:error] = 'Event must have at least 1 ticket types'
      redirect_to event_path
    end
  end

  def new
    @event = Event.new
    # build_venue method exists because belongs_to :venue has been defined.
    # Refer: http://guides.rubyonrails.org/association_basics.html#belongs-to-association-reference
    @event.build_venue 
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to root_path, flash: {success: 'Event was created'}
    else
      flash[:error] = 'Error happened when creating new event'
      render 'new'
    end
  end

  def update
    @event.update(event_params)
    redirect_to event_path, flash: {success: 'Event was successfully updated'}
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit! # permit all field
    end
end
