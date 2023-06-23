class EventReminderJob
  include Sidekiq::Job

  def perform
    events = Event.where(eventdate: 5.hours.from_now..6.hours.from_now)
    events.each do |e|
      EventsMailer.with(event: e, users_emails: e.users.pluck(:email)).event_reminder.deliver
    end
  end
end
