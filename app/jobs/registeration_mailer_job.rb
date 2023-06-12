class RegisterationMailerJob < ApplicationJob
  queue_as :urgent

  def perform(user)
    UserMailer.with(user: user).welcome_mail.deliver_now
  end
end
