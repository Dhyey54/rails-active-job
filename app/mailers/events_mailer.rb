class EventsMailer < ApplicationMailer
  def events_list
    @events = params[:events]
    mail(to: params[:user_emails], subject: "Events Available")
  end
end
