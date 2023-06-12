class EventsController < ApplicationController
  before_action :set_event, except: [:index]

  def index
    @events = Event.order(:id)
  end

  def show; end

  def destroy
    @event.destroy

    redirect_to events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
