class RegisterationMailerJob < ApplicationJob
  queue_as :urgent

  def perform(user)
    UserMailer.with(user: user).welcome_email.deliver_now
  end
end
