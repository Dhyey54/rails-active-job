class EventGenerationJob
  include Sidekiq::Job

  def perform
    event = Event.new
    event.title = Faker::Lorem.word
    event.description = Faker::Lorem.sentence
    event.event_date = Faker::Date.between(from: Date.tomorrow, to: 1.month.from_now)
    event.user_id = User.pluck(:id).sample
    event.save!
  end
end
