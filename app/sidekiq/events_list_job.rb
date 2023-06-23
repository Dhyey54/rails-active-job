class EventsListJob
  include Sidekiq::Job

  def perform
    emails = User.pluck(:email)
    events = Event.all
    EventsMailer.with(user_emails: emails, events: events).events_list.deliver_now
  end
end
