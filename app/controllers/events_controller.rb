class EventsController < ApplicationController
  before_action :set_event, except: [:index]

  def index
    @events = Event.order(:eventdate)
  end

  def show; end

  def enroll
    @event.users << current_user

    redirect_to events_path
  end

  def discard
    @event.users.destroy(current_user)

    redirect_to events_path
  end

  def destroy
    @event.destroy

    redirect_to events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
