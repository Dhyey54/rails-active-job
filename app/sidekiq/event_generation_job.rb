class EventGenerationJob
  include Sidekiq::Job

  def perform
    event = Event.new
    event.title = Faker::Lorem.word
    event.description = Faker::Lorem.sentence
    event.eventdate = Faker::Time.between(from: DateTime.tomorrow, to: 1.month.from_now)
    event.save!
  end
end
