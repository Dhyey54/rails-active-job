class EventsMailer < ApplicationMailer
  def events_list
    @events = params[:events]
    mail(to: params[:user_emails], subject: "Events Available")
  end

  def event_reminder
    @event = params[:event]
    mail(to: params[:users_emails], subject: "Reminder for your enrolled event")
  end
end
